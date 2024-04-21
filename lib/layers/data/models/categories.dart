// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Categories {
  List<dynamic> categories;
  Categories({
    required this.categories,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categories': categories.map((x) => x.toMap()).toList(),
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      categories: map['categories'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) => Categories.fromMap(json.decode(source) as Map<String, dynamic>);
}
