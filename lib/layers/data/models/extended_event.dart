// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExtendedEvent {
  int id;
  String name;
  String description;
  String date;
  int category;
  bool? accepted;
  ExtendedEvent({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.category,
    required this.accepted,
  });
}
