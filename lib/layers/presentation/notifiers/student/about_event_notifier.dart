// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/category.dart';
import 'package:hac/layers/data/models/event.dart';
import 'package:hac/layers/data/models/skill.dart';

class AboutEventNotifier extends ChangeNotifier {
  event myEvent;
  List<Category> categories = [];
  List<Skill> skills = [];

  AboutEventNotifier({
    required this.myEvent,
  }){
    _setup();
  }

  void _setup() async{
    Api api = Api();
    if(myEvent!.skills.isNotEmpty){
      for(int i = 0 ;i < myEvent!.skills.length;i++){
        skills.add(await api.getConcreteSkill(myEvent?.skills[i]));
    }
    }
    notifyListeners();
  }

  void sendApplication(int event_id) async {
    Api api = Api();
    const storage = FlutterSecureStorage();
    final token =  await storage.read(key: "token");
    await api.sendApplication(event_id, token!);
    _setup();
  }

  
}
