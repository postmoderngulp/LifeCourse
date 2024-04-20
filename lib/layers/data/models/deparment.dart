import 'dart:convert';

class Department {
    List<dynamic> departments;
  Department({
    required this.departments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'departments': departments,
    };
  }

  factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      departments:map['departments'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory Department.fromJson(String source) => Department.fromMap(json.decode(source) as Map<String, dynamic>);
}