// ignore_for_file: public_member_api_docs, sort_constructors_first
class Filter {
  String city;
  int age_gte;
  int age_lte;
  String university;
  String faculty;
  String department;
  String group;
  Filter({
    required this.city,
    required this.age_gte,
    required this.age_lte,
    required this.university,
    required this.faculty,
    required this.department,
    required this.group,
  });
}
