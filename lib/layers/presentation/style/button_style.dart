import 'package:flutter/material.dart';
import 'package:hac/layers/presentation/style/colors.dart';

abstract class MyButtonStyle {
  ButtonStyle mainButton = ButtonStyle(backgroundColor: const MaterialStatePropertyAll(MyColors.primary700),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5))));
}