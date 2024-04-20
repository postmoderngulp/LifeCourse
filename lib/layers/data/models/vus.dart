import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Vus {
  int id;
  String name;
  Vus({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Vus.fromMap(Map<String, dynamic> map) {
    return Vus(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vus.fromJson(String source) => Vus.fromMap(json.decode(source) as Map<String, dynamic>);
}
