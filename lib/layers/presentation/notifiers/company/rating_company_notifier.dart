import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/rating_student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RatingCompanyNotifier extends ChangeNotifier {
  List<RatingStudentData> ratings = [];


  RatingCompanyNotifier () {
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
  }


  // void searchProfile(String text,List<Student> students){
  //     thisstudents =  students.where((element) => element.last_name.toLowerCase().contains(text)).toList();
  //     notifyListeners();
  // }
  
}