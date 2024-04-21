import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class event {
  int id;
  String name;
  String description;
  String date;
  int category;
  List<dynamic> skills;
  bool requested;
  event({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.category,
    required this.skills,
    required this.requested,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'category': category,
      'skills': skills,
      'requested': requested,
    };
  }

  factory event.fromMap(Map<String, dynamic> map) {
    return event(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      category: map['category'] as int,
      skills: map['skills'] as List<dynamic>,
      requested: map['requested'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory event.fromJson(String source) => event.fromMap(json.decode(source) as Map<String, dynamic>);
}
