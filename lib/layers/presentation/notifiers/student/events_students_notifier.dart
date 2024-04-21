import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/application.dart';
import 'package:hac/layers/data/models/category.dart';
import 'package:hac/layers/data/models/event.dart';
import 'package:hac/layers/data/models/extended_event.dart';
import 'package:hac/layers/data/models/skill.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventsStudentNotifier extends ChangeNotifier {
  List<event> events = [];
  List<event> thisEvents = [];
  List<ExtendedEvent> ExtendedEvents = [];
  List<Category> categories = [];
  List<Application> accepted = [];
  List<Application> myAppps = [];
  List<event> myEvents = [];
  List<Application> nonAccepted = [];


  EventsStudentNotifier(){
    _setup();
  }

  void _setup() async{
    Api api = Api();
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    final filter =  sharedPreferences.getStringList('filterEvents');
    
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
        final myEvent = await api.getMyEvent(token);
    

    for(int i = 0; i< myEvent.events.length;i++){
      myEvents.add(event.fromMap(myEvent.events[i]));
    }
      }
      else {
      final myEvent = await api.getMyEvent(token);
    

    for(int i = 0; i< myEvent.events.length;i++){
      myEvents.add(event.fromMap(myEvent.events[i]));
    }
      thisEvents = events;
    }
    }
    else {
        final myEvent = await api.getMyEvent(token);
    

    for(int i = 0; i< myEvent.events.length;i++){
      myEvents.add(event.fromMap(myEvent.events[i]));
    }
      thisEvents = events;
    }
      

      


    // for(int i =0;i < accepted.length; i++){
    //   for(int j =0;j < events.length; j++){
    //   if(accepted[i].event == events[j].id){
    //     ExtendedEvents.add(ExtendedEvent(id: events[j].id, name: events[j].name, description: events[j].description, date: events[j].date, category: events[j].id, accepted: accepted[i].accepted,));
    //   }
    //  }
    //  }
    //  for(int i =0;i < nonAccepted.length; i++){
    //   for(int j =0;j < events.length; j++){
    //   if(nonAccepted[i].event == events[j].id){
    //     ExtendedEvents.add(ExtendedEvent(id: events[j].id, name: events[j].name, description: events[j].description, date: events[j].date, category: events[j].category, accepted: nonAccepted[i].accepted,));
    //   }
    //  }
    //  }


    // for(int k = 0; k < events.length ; k++){
    //   bool val = false;
    //   for(int i = 0; i < nonAccepted.length ; i++){
    //   if(nonAccepted[i].event != events[k].id){
    //     for(int j = 0; j < accepted.length ; j++){
    //       if(accepted[j].event == events[k].id){
    //         val = true;
    //       }
    //     }
    //   }
    //   else{
    //     val = true;
    //   }
    //  }
    //  if(val == false) ExtendedEvents.add(ExtendedEvent( id:  events[k].id, name: events[k].name, description: events[k].description, date: events[k].date, category: events[k].id, accepted: null));
    // }
     
   notifyListeners();
  }



  void sendApplication(int event_id) async {
    Api api = Api();
    const storage = FlutterSecureStorage();
    final token =  await storage.read(key: "token");
    await api.sendApplication(event_id, token!);
    myEvents.clear();
    _setup();
  }





  void searchProfile(String text,List<event> events){
      thisEvents =  events.where((element) => element.name.toLowerCase().contains(text)).toList();
      notifyListeners();
  }
}