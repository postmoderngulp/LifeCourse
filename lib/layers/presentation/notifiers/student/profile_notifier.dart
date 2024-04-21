import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/profile_student.dart';
import 'package:hac/layers/data/models/skill.dart';
import 'package:hac/layers/presentation/pages/auth/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileNotifier extends ChangeNotifier {
  MyProfile? profile;
  String university = '';
  String faculty = '';
  String department = '';
  String group = '';
  String about = '';
  Skill? skill;

  void logOut(BuildContext context) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setBool('session', false);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignIn(),),(r) => false);
  }

  ProfileNotifier(){
    _setup();
  }

  void _setup() async{
    Api api = Api();
    const storage = FlutterSecureStorage();
    final token =  await storage.read(key: "token");
    profile = await  api.getMyProfile(token!);
    if(profile!.about != null){
      about = utf8.decode(profile!.about!.runes.toList());
    }
  final skillls = await api.getAllSkills();
    for(int i = 0;i < skillls.length;i++){
      if(skillls[i].id == profile!.skills.first){
        skill = skillls[i];
      }
    }
     final unik =  await api.getConcreteUniversity(profile!.university);
     final fac =  await api.getConcreteFac(profile!.faculty);
     final caf =  await api.getConcreteCaf(profile!.department);
     final groupp =  await api.getConcreteGroup(profile!.group);
     university = unik.name;
     faculty = fac.name;
     department = caf.name;
     group = groupp.name;
    notifyListeners();
  }

}