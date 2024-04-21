import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupStudentNotifier extends ChangeNotifier {
  String group = '';
  List<Student> students = [];
  List<Student> thistudents = [];



  GroupStudentNotifier(){
    _setup();
  }


  void _setup()async {
    Api api = Api();
    const storage = FlutterSecureStorage();
    final token =  await storage.read(key: "token");
    final profile = await api.getMyProfile(token!);
    final groupp = await api.getConcreteGroup(profile.group);
    group = groupp.name;

      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     final list =  sharedPreferences.getStringList('filterGroupStudent');
      if(list != null){
        if(list.isEmpty){
          students = await api.getAllStudentByGroup(profile.group);
   for(int i = 0; i < students.length;i++){
        students[i].first_name = utf8.decode(students[i].first_name.runes
                              .toList());
                               students[i].second_name = utf8.decode(students[i].second_name.runes
                              .toList());
                               students[i].last_name = utf8.decode(students[i].last_name.runes
                              .toList());
      }
   thistudents = students;
        }
        else{
          students = await api.getAllStudentByGroupAge(profile.group,int.parse(list[0]),int.parse(list[1]));
   for(int i = 0; i < students.length;i++){
        students[i].first_name = utf8.decode(students[i].first_name.runes
                              .toList());
                               students[i].second_name = utf8.decode(students[i].second_name.runes
                              .toList());
                               students[i].last_name = utf8.decode(students[i].last_name.runes
                              .toList());
      }
   thistudents = students;
        }
      }
      else{
        students = await api.getAllStudentByGroup(profile.group);
   for(int i = 0; i < students.length;i++){
        students[i].first_name = utf8.decode(students[i].first_name.runes
                              .toList());
                               students[i].second_name = utf8.decode(students[i].second_name.runes
                              .toList());
                               students[i].last_name = utf8.decode(students[i].last_name.runes
                              .toList());
      }
   thistudents = students;
      }

   
   notifyListeners();
  }

  void searchProfile(String text,List<Student> events){
      thistudents =  events.where((element) => element.last_name.toLowerCase().contains(text)).toList();
      notifyListeners();
  }

}