
import 'package:flutter/material.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/category.dart';
import 'package:hac/layers/presentation/pages/student/main_student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterStudentEventNotifier  extends ChangeNotifier{
  List<Category> categories = [];
  String dob = '';
  String categoty = '';
  bool dobValide = false;

  FilterStudentEventNotifier(){
    _setup();
  }

  void _setup() async{
    Api api = Api();
     final val = await api.getALlCategories();
     for(int i = 0; i < val.categories.length;i++){
        categories.add(Category.fromMap(val.categories[i]));
     }
    notifyListeners();
  }

  void setDobValide(String dob){
    if(dob.length == 10) dobValide = DateTime.parse(dob).isAfter(DateTime.now()) ? false : true;
    notifyListeners();
  }


  void saveFilter(BuildContext context) async{
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    sharedPreferences.setStringList('filterEvents', [categoty,dob]);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainStudent(selectIndex: 2)));
  }

  void dropFilter(BuildContext context) async{
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    sharedPreferences.setStringList('filterEvents', []);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainStudent(selectIndex: 2)));
  }

}