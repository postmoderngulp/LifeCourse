// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/application.dart';
import 'package:hac/layers/data/models/student.dart';

class ParticipantCompanyNotifier extends ChangeNotifier {
  int event_id;
  List<Student> students = [];
  List<Student> thistudents = [];

  ParticipantCompanyNotifier({
    required this.event_id,
  }) {
    _setup();
  }


  void _setup() async{
    Api api = Api();
    List<Application> myApp = [];
    final listApp = await api.getAllApplicationAccepted();
     final students =  await api.getAllStudentWithOUtFilter();
     if(listApp.isNotEmpty){
      List<Student> listHelp = [];
      for(int i = 0;i < listApp.length; i++){
      if(listApp[i].event == event_id){
        myApp.add(listApp[i]);
      }
    } 
    for(int i = 0; i < myApp.length; i++){
      listHelp.add( await api.getConcreteStudent(myApp[i].student));
      notifyListeners();
    }
    for(int i = 0; i < myApp.length; i++){
      students[i].last_name = utf8.decode(students[i].last_name.runes.toList());
      students[i].first_name = utf8.decode(students[i].first_name.runes.toList());
      students[i].second_name = utf8.decode(students[i].second_name.runes.toList());
    }
    thistudents = listHelp;
     }
    
    notifyListeners();
  }
  
}
