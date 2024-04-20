import 'package:flutter/material.dart';
import 'package:hac/layers/presentation/notifiers/student/events_students_notifier.dart';
import 'package:provider/provider.dart';

class EventsStudent extends StatelessWidget {
  const EventsStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) =>  EventsStudentNotifier(),child: const SubEventsStudent(),);
  }
}



class SubEventsStudent extends StatelessWidget {
  const SubEventsStudent({super.key});
  @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.white, 
      child: SafeArea(child: Scaffold( 
        body: SingleChildScrollView( 
          physics: const BouncingScrollPhysics(), 
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [ 
               
            ], 
          ), 
        ), 
      )), 
    );

  }
}