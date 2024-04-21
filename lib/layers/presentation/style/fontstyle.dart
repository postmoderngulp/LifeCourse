

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hac/layers/presentation/style/colors.dart';

abstract class FontStylization{
  static TextStyle fieldStyle = TextStyle(
      color: MyColors.neutral300, fontFamily: "San Francisco", fontSize: 14.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none);
      static TextStyle inputfieldStyle = TextStyle(
      color: MyColors.neutral1000, fontFamily: "San Francisco", fontSize: 14.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none);
      static TextStyle addToMc = TextStyle(
      color: Colors.white, fontFamily: "San Francisco", fontSize: 10.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none);
      static TextStyle addToMcActive = TextStyle(
      color: MyColors.primary700, fontFamily: "San Francisco", fontSize: 10.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none);
      static TextStyle addToMcBig = TextStyle(
      color: Colors.white, fontFamily: "San Francisco", fontSize: 14.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none);
      static TextStyle ratingStyle = TextStyle(
      color: MyColors.neutral500, fontFamily: "San Francisco", fontSize: 14.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none);
      static TextStyle littleStyle = TextStyle(
      color: MyColors.neutral400, fontFamily: "San Francisco", fontSize: 12.sp,fontWeight: FontWeight.w400);
      static TextStyle littleBlackTxt = TextStyle(
      color: Colors.black, fontFamily: "San Francisco", fontSize: 12.sp,fontWeight: FontWeight.w400);
       static TextStyle likeText = TextStyle(
      color: MyColors.neutral600, fontFamily: "San Francisco", fontSize: 12.sp,fontWeight: FontWeight.w400);
      static TextStyle likeActiveText = TextStyle(
      color: MyColors.danger700, fontFamily: "San Francisco", fontSize: 12.sp,fontWeight: FontWeight.w400);
      static TextStyle typeText = TextStyle(
      color: MyColors.primary700, fontFamily: "San Francisco", fontSize: 12.sp,fontWeight: FontWeight.w400);
      static TextStyle subTitleSora = TextStyle(
      color: MyColors.neutral1000, fontFamily: "SoraRegular", fontSize: 12.sp);
      static TextStyle date = TextStyle(
      color: MyColors.neutral300, fontFamily: "Sora", fontSize: 9.sp,fontWeight: FontWeight.w400);
      static TextStyle vusStyle = TextStyle(
      color: MyColors.neutral300, fontFamily: "Sora", fontSize: 10.sp,fontWeight: FontWeight.w400);
      static TextStyle ratingStudentStyle = TextStyle(
      color: MyColors.neutral1000, fontFamily: "Sora", fontSize: 10.sp,fontWeight: FontWeight.w400);
      static TextStyle errorStyle = TextStyle(
      color: MyColors.danger700, fontFamily: "San Francisco", fontSize: 12.sp,fontWeight: FontWeight.w400);
        static TextStyle littleMainTxt = TextStyle(
      color: MyColors.primary700, fontFamily: "San Francisco", fontSize: 12.sp,fontWeight: FontWeight.w400);
      static TextStyle title = TextStyle(
      color: Colors.black, fontFamily: "Geometria", fontSize: 24.sp,fontWeight: FontWeight.w500);
      static TextStyle littleTitle = TextStyle(
      color: Colors.black, fontFamily: "Geometria", fontSize: 18.sp,fontWeight: FontWeight.w500);
      static TextStyle buttonTxtStyle = TextStyle(
      color: Colors.white, fontFamily: "San Francisco", fontSize: 16.sp,fontWeight: FontWeight.w500);
      static TextStyle activeButtonTxtStyle = TextStyle(
      color: MyColors.primary700, fontFamily: "San Francisco", fontSize: 16.sp,fontWeight: FontWeight.w500);
      static TextStyle second_text = TextStyle(
      color: MyColors.neutral300, fontFamily: "GeometriaLight", fontSize: 12.sp);
      static TextStyle mcStyle = TextStyle(
      color: MyColors.neutral1000, fontFamily: "Geometria", fontSize: 12.sp,fontWeight: FontWeight.w500);
      static TextStyle titleInfo = TextStyle(
      color: MyColors.neutral1000, fontFamily: "San Francisco", fontSize: 16.sp,fontWeight: FontWeight.w500);

      static TextStyle subAlert_title_text = TextStyle(
      color: Colors.black, fontFamily: "GeometriaMedium", fontSize: 16.sp);
}