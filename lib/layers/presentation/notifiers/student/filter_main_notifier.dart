import 'package:flutter/material.dart';

class FilterMainNotifier extends ChangeNotifier {
  String city = '';
  String vus = '';
  String fac = '';
  String caf = '';
  String group = '';
  String chapter = '';


  List<String> cities = ['Оренбург'];
  List<String> vuses = [];
  List<String> facs = [];
  List<String> cafs = [];
  List<String> groups = [];
  List<String> chapters = [];
}