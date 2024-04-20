import 'package:flutter/material.dart';

class RatingStudentsNotifier extends ChangeNotifier {
  String city = '';
  String vus = '';
  String fac = '';
  String caf = '';
  String group = '';


  List<String> cities = [];
  List<String> vuses = [];
  List<String> facs = [];
  List<String> cafs = [];
  List<String> groups = [];
}