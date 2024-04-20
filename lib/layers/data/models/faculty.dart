import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Faculty {
  List<dynamic> faculties;
  Faculty({
    required this.faculties,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'professions': faculties,
    };
  }

  factory Faculty.fromMap(Map<String, dynamic> map) {
    return Faculty(
      faculties:map['faculties'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory Faculty.fromJson(String source) => Faculty.fromMap(json.decode(source) as Map<String, dynamic>);
}
