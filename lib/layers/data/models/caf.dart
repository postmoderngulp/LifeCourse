import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Caf {
  int id;
  String name;
  Caf({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Caf.fromMap(Map<String, dynamic> map) {
    return Caf(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Caf.fromJson(String source) => Caf.fromMap(json.decode(source) as Map<String, dynamic>);
}
