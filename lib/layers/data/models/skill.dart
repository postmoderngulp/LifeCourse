import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Skill {
  int id;
  String name;
  Skill({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Skill.fromJson(String source) => Skill.fromMap(json.decode(source) as Map<String, dynamic>);
}
