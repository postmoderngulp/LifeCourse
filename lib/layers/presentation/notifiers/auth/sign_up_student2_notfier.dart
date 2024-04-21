import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/caf.dart';
import 'package:hac/layers/data/models/fac.dart';
import 'package:hac/layers/data/models/group.dart';
import 'package:hac/layers/data/models/skill.dart';
import 'package:hac/layers/data/models/vus.dart';
import 'package:hac/layers/presentation/pages/student/main_student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpStudent2Notifier extends ChangeNotifier {
  String age = '';
  String sex = "";
  String vus = "";
  String fac = "";
  String caf = "";
  String group = "";
  String skill = "";
  int student_id = 0;
  int group_id = 0;
  List<String> sexList = ["мужской", "женский"];
  List<Vus> vusList = [];
  List<Skill> skillList = [];
  List<Fac> facList = [];
  List<Caf> cafList = [];
  List<Group> groupList = [];
  bool sexValide = false;


  SignUpStudent2Notifier(int id){
    student_id = id;
    _setup();

  }

  void _setup() async{
    Api api = Api();
    final vus = await api.getAllUniversities();
    skillList  = await api.getAllSkills();
    for(int i = 0; i < vus.universities.length; i++){
      vusList.add(Vus.fromMap(vus.universities[i]));
    }
    for(int i = 0; i < skillList.length; i++){
     skillList[i].name  = utf8.decode(skillList[i].name.runes.toList());
    }
    notifyListeners();
  }

  void getFac(int vus_id) async {
    Api api = Api();
    final fac =  await api.getAllfaculties(vus_id);
    List<Fac> facs = [];
    for(int i = 0; i < fac.faculties.length; i++){
      facs.add(Fac.fromMap(fac.faculties[i]));
    }
    facList = facs;
    notifyListeners();
  }

 

  void getCaf(int fac_id) async {
    Api api = Api();
    final dep =  await api.getAllDepartments(fac_id);
    List<Caf> cafs = [];
    for(int i = 0; i < dep.departments.length; i++){
      cafs.add(Caf.fromMap(dep.departments[i]));
    }
    cafList = cafs;
    notifyListeners();
  }

   void getGroup(int caf_id) async {
    Api api = Api();
    final group =  await api.getAllGroups(caf_id);
    List<Group> groups = [];
    for(int i = 0; i < group.groups.length; i++){
      groups.add(Group.fromMap(group.groups[i]));
    }
    groupList = groups;
    notifyListeners();
  }

   void setSexValidate(String sex){
    sexValide = sex.isEmpty  ? false : true;
    notifyListeners();
  }


  void patchStudent(BuildContext context,int group_id,int student_id) async{
    try{
      Api api = Api();
    const storage = FlutterSecureStorage();
    int skill_id = 0;
    for(int i = 0; i < skillList.length;i++){
      if(skillList[i].name == skill){
        skill_id = skillList[i].id;
      }
    }
    final token = await storage.read(key: "token");
    api.patchStudent(student_id, token!,  int.parse(age), sex, '',group_id,skill_id);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setBool('session', true);
      Navigator.of(context).push(MaterialPageRoute(builder: ((context) => MainStudent(selectIndex: 0,))));
    }
    catch(e){
      debugPrint(e.toString());
    }
  }
}