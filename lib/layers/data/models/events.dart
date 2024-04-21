// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Eveents {
  List<dynamic> events;
  Eveents({
    required this.events,
  });

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'events': events,
    };
  }

  factory Eveents.fromMap(Map<String, dynamic> map) {
    return Eveents(
      events: map['events'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory Eveents.fromJson(String source) => Eveents.fromMap(json.decode(source) as Map<String, dynamic>);
}
