import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MyEvent {
  List<dynamic> events;
  MyEvent({
    required this.events,
  });


  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'events': events,
    };
  }

  factory MyEvent.fromMap(Map<String, dynamic> map) {
    return MyEvent(
      events: map['events'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyEvent.fromJson(String source) => MyEvent.fromMap(json.decode(source) as Map<String, dynamic>);
}
