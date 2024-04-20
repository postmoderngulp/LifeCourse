import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StudentId {
  int id;
  StudentId({
    required this.id,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory StudentId.fromMap(Map<String, dynamic> map) {
    return StudentId(
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentId.fromJson(String source) => StudentId.fromMap(json.decode(source) as Map<String, dynamic>);
}
