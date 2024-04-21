
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hac/layers/presentation/notifiers/student/student_redact_notifier.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';
import 'package:provider/provider.dart';

class StudentRedact extends StatelessWidget {
  const StudentRedact({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => StudentRedactNotifier(),child: const SubStudentRedact(),);
  }
}


class SubStudentRedact extends StatelessWidget {
  const SubStudentRedact({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StudentRedactNotifier>();
    return Container( 
      color: Colors.white, 
      child: SafeArea(child: Scaffold( 
        backgroundColor: Colors.white,
        body: SingleChildScrollView( 
          physics: const BouncingScrollPhysics(), 
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [ 
                Padding(
              padding: EdgeInsets.only(left: 20.w, top: 25.h),
              child: const Align(
                  alignment: Alignment.topLeft, child: BackButton()),
            ),
             SizedBox(height: 20.h,),
                 Padding(
                  padding:  EdgeInsets.only(left: 30.w),
                  child: Text('Редактирование',style: FontStylization.title,),
                ),
                SizedBox(height: 25.h,),
                GestureDetector(
                  onTap: () => notifier.chooseImage(),
                  child: Padding(
                    padding:  EdgeInsets.only(left: 28.w),
                    child: notifier.bytes != null ? Container(
                      width: 146.w,
                        height: 146.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: MemoryImage(notifier.bytes as Uint8List),fit: BoxFit.cover)
                        ),
                     ) : SvgPicture.asset(
                        "assets/image/noImage.svg",
                        width: 146.w,
                        height: 146.h,
                      ),
                  ),
                ),
                    SizedBox(height: 30.h,),
                    const NicknameField(),
                    SizedBox(height: 20.h,),
                    const AgeField(),
                    SizedBox(height: 20.h,),
                    const SexField(),
                    SizedBox(height: 20.h,),
                    const SkillsField(),
                    SizedBox(height: 20.h,),
                    const VusField(),
                    SizedBox(height: 20.h,),
                    const FacField(),
                    SizedBox(height: 20.h,),
                    const CafField(),
                    SizedBox(height: 20.h,),
                    const GroupField(),
                    SizedBox(height: 20.h,),
                    const AboutField(),
                    SizedBox(height: 30.h,),
                    const SaveButton(),
                    SizedBox(height: 30.h,),

              ], 
            ),
          ), 
        ), 
      )), 
    );

  }
}





class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: SvgPicture.asset(
          "assets/image/arrow-left.svg",
          width: 22.w,
          height: 22.h,
        ));
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StudentRedactNotifier>();
    return Center(
      child: SizedBox(
        width: 279.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => notifier.saveRedact(notifier.age, notifier.aboutme, notifier.nickname, '',context),style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(MyColors.primary700),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)))), child: Text('Сохранить',style: FontStylization.buttonTxtStyle,),)),
    );
  }
}


class NicknameField extends StatelessWidget {
  const NicknameField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StudentRedactNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: TextFormField(
          onChanged: (value) {
            notifier.nickname = value;
            notifier.setNicknameValidate(notifier.nickname);
          } ,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            filled: true,
            fillColor: Colors.white,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color:MyColors.neutral500, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: MyColors.neutral500, width: 1),
                borderRadius: BorderRadius.circular(10.0)),
            hintText: utf8.decode(notifier.nickname.runes
                              .toList()),
            hintStyle: FontStylization.inputfieldStyle,
          ),
        ),
      ),
    );
  }
}


class SexField extends StatefulWidget {
  const SexField({super.key});

  @override
  State<SexField> createState() => _SexFieldState();
}

class _SexFieldState extends State<SexField> {
  final dropValue = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StudentRedactNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: Material(
          child: ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15.0),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                  ),
                  isExpanded: true,
                  hint: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      notifier.sex,
                      style: FontStylization.inputfieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                     notifier.sex = choice.toString();
                    notifier.setSexValidate(notifier.sex);
                  },
                  items: notifier.sexList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                );
              }),
        ),
      ),
    );
  }
}



class VusField extends StatelessWidget {
  const VusField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StudentRedactNotifier>();
    
    final dropValue = ValueNotifier('');
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: Material(
          child: ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15.0),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                  ),
                  isExpanded: true,
                  hint: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      notifier.university,
                      style: FontStylization.inputfieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                   notifier.university = choice as String;
                   for(int i = 0; i< notifier.vusList.length;i++){
                      if(notifier.vusList[i].name == notifier.university){
                        notifier.getFac(notifier.vusList[i].id);
                      }
                    }
                  },
                  items: notifier.vusList
                      .map((e) => DropdownMenuItem(
                            value: e.name,
                            child: Text(e.name),
                          ))
                      .toList(),
                );
              }),
        ),
      ),
    );
  }
}


class SkillsField extends StatelessWidget {
  const SkillsField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StudentRedactNotifier>();
    final dropValue = ValueNotifier('');
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: Material(
          child: ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15.0),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                  ),
                  isExpanded: true,
                  hint: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      'Навыки',
                      style: FontStylization.inputfieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                   notifier.skill = choice as String;
                  },
                  items: notifier.skills
                      .map((e) => DropdownMenuItem(
                            value: e.name,
                            child: Text(e.name),
                          ))
                      .toList(),
                );
              }),
        ),
      ),
    );
  }
}


class FacField extends StatelessWidget {
  const FacField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StudentRedactNotifier>();
    
    final dropValue = ValueNotifier('');
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: Material(
          child: ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15.0),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                  ),
                  isExpanded: true,
                  hint: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      notifier.fac,
                      style: FontStylization.inputfieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                   notifier.fac = choice as String;
                   for(int i = 0; i< notifier.facList.length;i++){
                      if(notifier.facList[i].name == notifier.fac){
                        notifier.getCaf(notifier.facList[i].id);
                      }
                    }
                  },
                  items: notifier.facList
                      .map((e) => DropdownMenuItem(
                            value: e.name,
                            child: Text(e.name),
                          ))
                      .toList(),
                );
              }),
        ),
      ),
    );
  }
}


class CafField extends StatelessWidget {
  const CafField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StudentRedactNotifier>();
    
    final dropValue = ValueNotifier('');
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: Material(
          child: ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15.0),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                  ),
                  isExpanded: true,
                  hint: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      notifier.caf,
                      style: FontStylization.inputfieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                   notifier.caf = choice as String;
                   for(int i = 0; i< notifier.cafList.length;i++){
                      if(notifier.cafList[i].name == notifier.caf){
                        notifier.getGroup(notifier.cafList[i].id);
                      }
                    }
                  },
                  items: notifier.cafList
                      .map((e) => DropdownMenuItem(
                            value: e.name,
                            child: Text(e.name),
                          ))
                      .toList(),
                );
              }),
        ),
      ),
    );
  }
}


class GroupField extends StatelessWidget {
  const GroupField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StudentRedactNotifier>();
    
    final dropValue = ValueNotifier('');
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: Material(
          child: ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15.0),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
                  ),
                  isExpanded: true,
                  hint: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      notifier.group,
                      style: FontStylization.inputfieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                   notifier.group = choice as String;
                  },
                  items: notifier.groupList
                      .map((e) => DropdownMenuItem(
                            value: e.name,
                            child: Text(e.name),
                          ))
                      .toList(),
                );
              }),
        ),
      ),
    );
  }
}




class AboutField extends StatelessWidget {
  const AboutField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StudentRedactNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 115.h,
        child: CupertinoTextField(
        onChanged: (value)  => notifier.aboutme = value,
        padding: EdgeInsets.only(left: 14.w, top: 14.h),
        placeholder: notifier.aboutme.isEmpty ? 'О себе' : notifier.aboutme,
        placeholderStyle: FontStylization.fieldStyle,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.top,
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.neutral500),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      ),
    );
  }
}





class AgeField extends StatelessWidget {
  const AgeField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StudentRedactNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: TextFormField(
          onChanged: (value) {
            notifier.age = value;
          } ,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            filled: true,
            fillColor: Colors.white,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color:MyColors.neutral500, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: MyColors.neutral500, width: 1)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: MyColors.neutral500, width: 1),
                borderRadius: BorderRadius.circular(10.0)),
            hintText: notifier.age,
            hintStyle: FontStylization.inputfieldStyle,
          ),
        ),
      ),
    );
  }
}