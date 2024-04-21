import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/application.dart';
import 'package:hac/layers/data/models/category.dart';
import 'package:hac/layers/data/models/event.dart';
import 'package:hac/layers/data/models/extended_event.dart';
import 'package:hac/layers/data/models/skill.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventCompanyNotifier extends ChangeNotifier {
  List<event> events = [];
  List<event> thisEvents = [];
  List<ExtendedEvent> ExtendedEvents = [];
  List<Category> categories = [];
  List<Application> accepted = [];
  List<Application> myAppps = [];
  List<Application> nonAccepted = [];
  List<event> myEvents = [];


  EventCompanyNotifier(){
    _setup();
  }


  void _setup() async{
    Api api = Api();
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    final filter =  sharedPreferences.getStringList('filterEvents');
     accepted = await api.getAllApplicationAccepted();
     nonAccepted = await api.getAllApplicationNonAccepted();
     final val = await api.getALlCategories();
     const storage = FlutterSecureStorage();
    final token = await storage.read(key: "token");
     final profile = await api.getMyProfile(token!);
    List<Skill> skills = [];

      

    if(filter != null){
      if(filter.isNotEmpty){
        for(int i = 0; i< val.categories.length;i++){
      skills.add(Skill.fromMap(val.categories[i]));
     }
     int id = 0;
     for(int i = 0; i< skills.length;i++){
      if(filter![0] == skills[i].name){
        id = skills[i].id;
      }
     }
    

    
        // events =  await api.getAllEventFilter(filter[1],id);
        final myEvent =  await api.getAllEvent();
        for(int i = 0; i< myEvent.events.length;i++){
      myEvents.add(event.fromMap(myEvent.events[i]));
    }
        thisEvents = events;
      }
      else {
      final myEvent =  await api.getAllEvent();
        for(int i = 0; i< myEvent.events.length;i++){
      myEvents.add(event.fromMap(myEvent.events[i]));
    }
      thisEvents = events;
    }
    }
    else {
      final myEvent =  await api.getAllEvent();
        for(int i = 0; i< myEvent.events.length;i++){
      myEvents.add(event.fromMap(myEvent.events[i]));
    }
      thisEvents = events;
    }
      accepted = await api.getAllApplicationAccepted();
      nonAccepted = await api.getAllApplicationNonAccepted();

      for(int i = 0; i< accepted.length;i++){
        if(accepted[i].student == profile.id){
            myAppps.add(accepted[i]);
        }
      }

      for(int i = 0; i < nonAccepted.length;i++){
        if(nonAccepted[i].student == profile.id){
            myAppps.add(nonAccepted[i]);
        }
      }


      notifyListeners();
  }


  
}