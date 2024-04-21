import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/caf.dart';
import 'package:hac/layers/data/models/fac.dart';
import 'package:hac/layers/data/models/group.dart';
import 'package:hac/layers/data/models/skill.dart';
import 'package:hac/layers/data/models/vus.dart';
import 'package:image_picker/image_picker.dart';

class StudentRedactNotifier extends ChangeNotifier {
  String nickname = '';
  String age = '';
  String sex = '';
  String university = '';
  String skill = '';
  String fac = '';
  String caf = '';
  String group = '';
  String aboutme = '';
  bool sexValide = false;
  List<String> sexList = ["мужской", "женский"];
  List<Skill> skills = [];
  List<Vus> vusList = [];
  List<Fac> facList = [];
  List<Caf> cafList = [];
  List<Group> groupList = [];
   bool nicknameValidate = false;
    XFile? file;
  Uint8List? bytes;

   void setNicknameValidate(String nick){
    nicknameValidate = nick.length < 4 ? false : true;
    notifyListeners();
  }

    void setSexValidate(String sex){
    sexValide = sex.isEmpty  ? false : true;
    notifyListeners();
  }

  StudentRedactNotifier(){
    _setup();
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



  void _setup() async{
    Api api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: "token",);
    final profile = await api.getMyProfile(token!);
     skills =  await api.getAllSkills();
     for(int i = 0;i < skills.length;i++){
      skills[i].name = utf8.decode(skills[i].name.runes
                              .toList());
     }
    final vus = await api.getAllUniversities();
    for(int i = 0; i < vus.universities.length; i++){
      vusList.add(Vus.fromMap(vus.universities[i]));
    }
    nickname = "${profile.last_name} ${profile.first_name} ${profile.second_name}";
    age = profile.age.toString();
    sex = utf8.decode(profile.sex.runes.toList());
    if(profile.about != null) aboutme = profile.about! ;
    final unik =  await api.getConcreteUniversity(profile.university);
    final faculty = await api.getConcreteFac(profile.faculty);
    final cafedra =  await api.getConcreteCaf(profile.department);
    final grouppp = await api.getConcreteGroup(profile.group);
    university = unik.name;
    fac = faculty.name;
    caf = cafedra.name;
    group = grouppp.name;
    notifyListeners();

  }



  void saveRedact(String age,String about,String full_name,String resume,BuildContext context) async{
    Api api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: "token",);
     final vus = await api.getAllUniversities();
     List<Vus> VusList = [];
     int vus_id = 0;
    for(int i = 0; i < vus.universities.length; i++){
      VusList.add(Vus.fromMap(vus.universities[i]));
    }
    for(int i = 0; i < VusList.length; i++){
      if(VusList[i].name == university){
        vus_id = VusList[i].id;
      }
    }


    List<Fac> FacList = [];
    int fac_id = 0;
    final profile = await api.getMyProfile(token!);
    final Faac = await api.getAllfaculties(vus_id == 0 ? profile.university  : vus_id);
    for(int i = 0; i < Faac.faculties.length; i++){
      FacList.add(Fac.fromMap(Faac.faculties[i]));
    }
    for(int i = 0; i < FacList.length; i++){
      if(FacList[i].name == fac){
        fac_id = FacList[i].id;
      }
    }

    List<Caf> CafList = [];
    int caf_id = 0;
    final Caaf = await api.getAllDepartments(fac_id);
    for(int i = 0; i < Caaf.departments.length; i++){
      CafList.add(Caf.fromMap(Caaf.departments[i]));
    }
    for(int i = 0; i < CafList.length; i++){
      if(CafList[i].name == caf){
        caf_id = CafList[i].id;
      }
    }


    List<Group> GroupList = [];
    int group_id = 0;
    final Grooup = await api.getAllGroups(caf_id);
    for(int i = 0; i < Grooup.groups.length; i++){
      GroupList.add(Group.fromMap(Grooup.groups[i]));
    }
    for(int i = 0; i < GroupList.length; i++){
      if(GroupList[i].name == group){
        group_id = GroupList[i].id;
      }
    }

    
    int skill_id = 0;
    final Skiill = await api.getAllSkills();
    for(int i = 0; i < Skiill.length; i ++){
      Skiill[i].name = utf8.decode(Skiill[i].name.runes.toList());
    }
    for(int i = 0; i < Skiill.length; i++){
      if(Skiill[i].name == skill){
        skill_id = Skiill[i].id;
      }
    }

    api.redactStudent(profile.id, token, int.parse(age), sex, about, group_id, full_name, '', resume, vus_id, fac_id, caf_id, skill_id == 0 ? profile.skills.first : skill_id);
    Navigator.of(context).pop();
  }


  void chooseImage() async {
      ImagePicker picker = ImagePicker();
       file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(file == null) return;
     bytes =  await file!.readAsBytes();
     notifyListeners();
  }
}