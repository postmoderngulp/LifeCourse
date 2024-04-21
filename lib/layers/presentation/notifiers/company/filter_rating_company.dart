import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/caf.dart';
import 'package:hac/layers/data/models/fac.dart';
import 'package:hac/layers/data/models/group.dart';
import 'package:hac/layers/data/models/vus.dart';
import 'package:hac/layers/presentation/pages/student/main_student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterRatingCompany extends ChangeNotifier {
   String city = '';
  String age_gte = '0';
  String age_lte= '50';
  String vus = '';
  String fac = '';
  String caf = '';
  String group = '';


  List<String> cities = [];
  List<Vus> vusList = [];
  List<Fac> facList = [];
  List<Caf> cafList = [];
  List<Group> groupList = [];


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


  void dropFilter(BuildContext context) async{
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    sharedPreferences.setStringList('ratingFilter', []);
    
  }


  void save(BuildContext context) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList('ratingFilter', [city,age_gte,age_lte,vus,fac,caf,group]);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) 
        => MainStudent(selectIndex: 1,)),(r) => false);
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
}