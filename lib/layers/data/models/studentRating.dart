import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StudentRating {
  List<dynamic>   students;
  StudentRating({
    required this.students,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'students': students,
    };
  }

  factory StudentRating.fromMap(Map<String, dynamic> map) {
    return StudentRating(
      students: map['students'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentRating.fromJson(String source) => StudentRating.fromMap(json.decode(source) as Map<String, dynamic>);
}
