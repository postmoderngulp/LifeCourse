
import 'package:flutter/material.dart';
import 'package:hac/layers/data/models/category.dart';
import 'package:hac/layers/presentation/pages/company/main_company.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterCompanyNotifier extends ChangeNotifier {
  List<Category> categories = [];
  String dob = '';
  String categoty = '';
  bool dobValide = false;



  void setDobValide(String dob){
    if(dob.length == 10) dobValide = DateTime.parse(dob).isAfter(DateTime.now()) ? false : true;
    notifyListeners();
  }


  void saveFilter(BuildContext context) async{
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    sharedPreferences.setStringList('filterEvents', [categoty,dob]);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainCompany(selectIndex: 2)));
  }

  void dropFilter(BuildContext context) async{
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    sharedPreferences.setStringList('filterEvents', []);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainCompany(selectIndex: 2)));
  }
}