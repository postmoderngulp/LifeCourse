import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Event_req {
  int id;
  String name;
  String description;
  String date;
  int category;
  List<dynamic> skills;
  Event_req({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.category,
    required this.skills,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'category': category,
      'skills': skills,
    };
  }

  factory Event_req.fromMap(Map<String, dynamic> map) {
    return Event_req(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      category: map['category'] as int,
      skills: map['skills'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event_req.fromJson(String source) => Event_req.fromMap(json.decode(source) as Map<String, dynamic>);
}
