
import 'package:flutter/material.dart';
import 'package:hac/layers/presentation/pages/student/group.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterStudentGroupNotifier extends ChangeNotifier {
  String age_gte = '15';
  String age_lte = '50';

   void save(BuildContext context) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList('filterGroupStudent', [age_gte,age_lte]);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) 
        => const GroupStudent()));
}

   void dropFilter(BuildContext context) async{
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    sharedPreferences.setStringList('filterGroupStudent', []);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GroupStudent()));
  }
  
}