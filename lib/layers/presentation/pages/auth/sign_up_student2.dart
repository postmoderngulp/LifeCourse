// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:hac/layers/presentation/notifiers/auth/sign_up_student2_notfier.dart';
import 'package:hac/layers/presentation/pages/auth/sign_in.dart';
import 'package:hac/layers/presentation/pages/student/main_student.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';

class SignUpStudent2 extends StatelessWidget {
  int id;
  SignUpStudent2({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(create: (BuildContext context) => SignUpStudent2Notifier(id),
    child: const SubSignUpStudent2(),);
  }
}

class SubSignUpStudent2 extends StatelessWidget {
  const SubSignUpStudent2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.white, 
      child: SafeArea(child: Scaffold( 
        backgroundColor: Colors.white,
        body: SingleChildScrollView( 
          physics: const BouncingScrollPhysics(), 
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [ 
                Padding(
              padding: EdgeInsets.only(left: 20.w, top: 25.h),
              child: const Align(
                  alignment: Alignment.topLeft, child: BackButton()),
            ),
            SizedBox(height: 25.h,),
              Padding(
                padding:  EdgeInsets.only(left: 30.w),
                child: Text('Регистрация студента',style: FontStylization.title,),
              ),
              SizedBox(height: 40.h,),
              const AgeField(),
              SizedBox(height: 20.h,),
              const SexField(),
              SizedBox(height: 20.h,),
              VusField(),
              SizedBox(height: 20.h,),
              FacField(),
              SizedBox(height: 20.h,),
              CafField(),
              SizedBox(height: 20.h,),
              GroupField(),
              SizedBox(height: 100.h,),
              FinishButton(),
              SizedBox(height: 20.h,),
  Center(
    child: GestureDetector(
      onTap: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignIn()),(r) => false),
      child: Text('Есть аккаунт? Войти',style: FontStylization.littleMainTxt,)),
  ),
  SizedBox(height: 20.h,),
            ], 
          ), 
        ), 
      )), 
    );

  }
}



class FinishButton extends StatelessWidget {
  const FinishButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpStudent2Notifier>();
    return Center(
      child: SizedBox(
        width: 245.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => notifier.patchStudent(context, notifier.group_id,notifier.student_id),style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(MyColors.primary700),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)))), child: Text('Завершить',style: FontStylization.buttonTxtStyle,),)),
    );
  }
}


class SexField extends StatelessWidget {
  const SexField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpStudent2Notifier>();
    
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
                      'Пол',
                      style: FontStylization.fieldStyle,
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


class VusField extends StatefulWidget {
   final dropValue = ValueNotifier('');
   VusField({super.key});

  @override
  State<VusField> createState() => _VusFieldState();
}

class _VusFieldState extends State<VusField> {
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpStudent2Notifier>();
   
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: Material(
          child: ValueListenableBuilder(
              valueListenable:widget.dropValue,
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
                      'ВУЗ',
                      style: FontStylization.fieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    widget.dropValue.value = choice.toString();
                    notifier.vus = choice as String;
                    for(int i = 0; i< notifier.vusList.length;i++){
                      if(notifier.vusList[i].name == notifier.vus){
                        notifier.getFac(notifier.vusList[i].id);
                      }
                    }
                  },
                  items: 
                      notifier.vusList.map((e) => DropdownMenuItem(
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


class FacField extends StatefulWidget {
  const FacField({super.key});

  @override
  State<FacField> createState() => _FacFieldState();
}

class _FacFieldState extends State<FacField> {
  final dropValue = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpStudent2Notifier>();
    
    
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
                      'Факультет',
                      style: FontStylization.fieldStyle,
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
                  items: 
                      notifier.facList.map((e) => DropdownMenuItem(
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


class CafField extends StatefulWidget {
  const CafField({super.key});

  @override
  State<CafField> createState() => _CafFieldState();
}

class _CafFieldState extends State<CafField> {
  final dropValue = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpStudent2Notifier>();
    
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
                      'Кафедра',
                      style: FontStylization.fieldStyle,
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
                  items: 
                      notifier.cafList.map((e) => DropdownMenuItem(
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


class GroupField extends StatefulWidget {
  const GroupField({super.key});

  @override
  State<GroupField> createState() => _GroupFieldState();
}

class _GroupFieldState extends State<GroupField> {
  final dropValue = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpStudent2Notifier>();
    
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
                      'Группа',
                      style: FontStylization.fieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                    notifier.group = choice as String;
                    for(int i = 0; i < notifier.groupList.length;i++){
                      if(notifier.group == notifier.groupList[i].name){
                          notifier.group_id = notifier.groupList[i].id;
                      }
                    }
                  },
                  items: 
                      notifier.groupList.map((e) => DropdownMenuItem(
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



class AgeField extends StatelessWidget {
  const AgeField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpStudent2Notifier>();
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
            hintText: "ФИО",
            hintStyle: FontStylization.fieldStyle,
          ),
        ),
      ),
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