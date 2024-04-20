import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Fac {
  int id;
  String name;
  Fac({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Fac.fromMap(Map<String, dynamic> map) {
    return Fac(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Fac.fromJson(String source) => Fac.fromMap(json.decode(source) as Map<String, dynamic>);
}
