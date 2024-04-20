import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class City {
  List<dynamic> cities;
  City({
    required this.cities,
  });

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'cities': cities,
    };
  }

  factory City.fromMap(Map<dynamic, dynamic> map) {
    return City(
      cities:map['cities'] as List<dynamic>,
    );
  }

  dynamic toJson() => json.encode(toMap());

  factory City.fromJson(dynamic source) => City.fromMap(json.decode(source) as Map<dynamic, dynamic>);
}
