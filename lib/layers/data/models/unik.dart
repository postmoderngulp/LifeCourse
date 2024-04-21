import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Unik {
  String name;
  int id;
  Unik({
    required this.name,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory Unik.fromMap(Map<String, dynamic> map) {
    return Unik(
      name: map['name'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Unik.fromJson(String source) => Unik.fromMap(json.decode(source) as Map<String, dynamic>);
}
