import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/caf.dart';
import 'package:hac/layers/data/models/fac.dart';
import 'package:hac/layers/data/models/group.dart';
import 'package:hac/layers/data/models/rating_student.dart';
import 'package:hac/layers/data/models/student.dart';
import 'package:hac/layers/data/models/unik.dart';
import 'package:hac/layers/data/models/vus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RatingStudentsNotifier extends ChangeNotifier {
  String city = '';
  String vus = '';
  String fac = '';
  String caf = '';
  String group = '';
  String nickname = '';

  int vus_id = 1;
  int fac_id = 1;
  int caf_id = 1;
  int group_id = 1;

  List<Unik> myuniversity = [];
  List<Vus> vusList = [];
  List<Fac> facList = [];
  List<Caf> cafList = [];
  List<Group> groupList = [];
  List<RatingStudentData> ratings = [];
  List<String> cities = [];
  List<String> vuses = [];
  List<String> facs = [];
  List<String> cafs = [];
  List<String> groups = [];

  List<Student> students = [];
  List<Student> thisstudents = [];


  RatingStudentsNotifier(){
    _setup();
  }

  void _setup() async{
    Api api = Api();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final studentRatings =  await  api.getRating();
    
    for(int i = 0; i< studentRatings.students.length;i++){
      ratings.add(RatingStudentData.fromMap(studentRatings.students[i]));
    }

    for(int i = 0; i < ratings.length; i++){
      ratings[i].name = utf8.decode(ratings[i].name.runes.toList());

    }
    notifyListeners();

    // final val =  sharedPreferences.getStringList('ratingFilter');
    // if(val != null){
    //   if(val.isNotEmpty){
    //     final vus = await api.getAllUniversities();
    // for(int i = 0; i < vus.universities.length; i++){
    //   vusList.add(Vus.fromMap(vus.universities[i]));
    // }
    // for(int i = 0; i < vusList.length; i++){
    //   if(vusList[i].name == val[3]){
    //     vus_id = vusList[i].id;
    //   }
    // }

    // final fac = await api.getAllfaculties(vus_id);
    // for(int i = 0; i < fac.faculties.length; i++){
    //   facList.add(Fac.fromMap(fac.faculties[i]));
    // }
    // for(int i = 0; i < facList.length; i++){
    //   if(facList[i].name == val[4]){
    //     fac_id = facList[i].id;
    //   }
    // }

    // final caf = await api.getAllDepartments(fac_id);
    // for(int i = 0; i < caf.departments.length; i++){
    //   cafList.add(Caf.fromMap(caf.departments[i]));
    // }
    // for(int i = 0; i < cafList.length; i++){
    //   if(cafList[i].name == val[5]){
    //     caf_id = cafList[i].id;
    //   }
    // }

    // final group = await api.getAllGroups(caf_id);
    // for(int i = 0; i < group.groups.length; i++){
    //   groupList.add(Group.fromMap(group.groups[i]));
    // }
    // for(int i = 0; i < groupList.length; i++){
    //   if(groupList[i].name == val[6]){
    //     group_id = groupList[i].id;
    //   }
    // }
    //   students =  await api.getAllStudent(nickname, int.parse(val[1]), int.parse(val[2]), vus_id, fac_id, caf_id, group_id);
    //   for(int i = 0; i < students.length;i++){
    //     students[i].first_name = utf8.decode(students[i].first_name.runes
    //                           .toList());
    //                            students[i].second_name = utf8.decode(students[i].second_name.runes
    //                           .toList());
    //                            students[i].last_name = utf8.decode(students[i].last_name.runes
    //                           .toList());
    //   }
    //   for(int i = 0; i < students.length;i++){
    //     if(students[i].university != null) myuniversity.add(await api.getConcreteUniversity(students[i].university as int));
    //   }
    //   thisstudents = students;
    //   }
    //   else {
    //   students =  await api.getAllStudentWithOUtFilter();
    //   for(int i = 0; i < students.length;i++){
    //     students[i].first_name = utf8.decode(students[i].first_name.runes
    //                           .toList());
    //                            students[i].second_name = utf8.decode(students[i].second_name.runes
    //                           .toList());
    //                            students[i].last_name = utf8.decode(students[i].last_name.runes
    //                           .toList());
    //   }
    //   for(int i = 0; i < students.length;i++){
    //     if(students[i].university != null) myuniversity.add(await api.getConcreteUniversity(students[i].university as int));
    //   }
    //    thisstudents = students;
    // }
      
    // }
    // else{
    //   students =  await api.getAllStudentWithOUtFilter();
    //   for(int i = 0; i < students.length;i++){
    //     students[i].first_name = utf8.decode(students[i].first_name.runes
    //                           .toList());
    //                            students[i].second_name = utf8.decode(students[i].second_name.runes
    //                           .toList());
    //                            students[i].last_name = utf8.decode(students[i].last_name.runes
    //                           .toList());
    //   }
    //   for(int i = 0; i < students.length;i++){
    //     if(students[i].university != null) myuniversity.add(await api.getConcreteUniversity(students[i].university as int));
    //   }
    //    thisstudents = students;
    // }
    notifyListeners();
  }


  

  void searchProfile(String text,List<Student> students){
      thisstudents =  students.where((element) => element.last_name.toLowerCase().contains(text)).toList();
      notifyListeners();
  }

}