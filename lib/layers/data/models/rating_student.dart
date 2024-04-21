import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RatingStudentData {
  int id;
  String name;
  int stars;
  RatingStudentData({
    required this.id,
    required this.name,
    required this.stars,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'stars': stars,
    };
  }

  factory RatingStudentData.fromMap(Map<String, dynamic> map) {
    return RatingStudentData(
      id: map['id'] as int,
      name: map['name'] as String,
      stars: map['stars'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingStudentData.fromJson(String source) => RatingStudentData.fromMap(json.decode(source) as Map<String, dynamic>);
}
