import 'package:flutter/cupertino.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/event_req.dart';
import 'package:hac/layers/data/models/skill.dart';

class AboutCompanyNotifier extends ChangeNotifier {
    int event_id;
  Event_req? MyEvent;
  List<Skill> skills = [];
  
  AboutCompanyNotifier({
    required this.event_id,
  }){
    _setup();
  }

  void _setup() async{
    Api api = Api();
    MyEvent = await api.getConcreteEvent(event_id);
    if(MyEvent!.skills.isNotEmpty){
      for(int i = 0 ;i < MyEvent!.skills.length;i++){
        skills.add(await api.getConcreteSkill(MyEvent?.skills[i]));
    }
    }
    notifyListeners();
  }

  
}