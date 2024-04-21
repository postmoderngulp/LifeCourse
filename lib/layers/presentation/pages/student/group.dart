// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hac/layers/presentation/notifiers/student/filter_group_student_notifier.dart';
import 'package:provider/provider.dart';

import 'package:hac/layers/presentation/notifiers/student/group_student_notifier.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';

class GroupStudent extends StatelessWidget {
  const GroupStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => GroupStudentNotifier(),child: const SubGroupStudent(),);
  }
}


class SubGroupStudent extends StatelessWidget {
  const SubGroupStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<GroupStudentNotifier>();
    return Container( 
      color: Colors.white, 
      child: SafeArea(child: Scaffold( 
        backgroundColor: Colors.white,
        body: SingleChildScrollView( 
          physics: const BouncingScrollPhysics(), 
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [ 
               SizedBox(height: 20.h,),
              Row(
                children: [
                  SizedBox(width: 13.w,),
                     GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: SvgPicture.asset('assets/image/back.svg')),
                     SizedBox(width: 15.w ,),
               Text(notifier.group,style: FontStylization.littleTitle,),
                ],
              ),
              SizedBox(height: 22.h,),
              const FilterField(),
              SizedBox(height: 19.h,),
              const Students(),

            ], 
          ), 
        ), 
      )), 
    );

  }
}


class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
     final notifier = context.watch<GroupStudentNotifier>();
    return ListView.builder(
      itemCount: notifier.thistudents.length,
      shrinkWrap:  true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index)  =>  Padding(
        padding:  EdgeInsets.only(left: 21.w,right: 29.w,bottom: 5.h),
        child: StudentsItem(index: index,),
      ),);
  }
}

class StudentsItem extends StatelessWidget {
  int index;
  StudentsItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final notifier = context.watch<GroupStudentNotifier>();
    return Row(children: [
      Container(
        width: 45.w,
        height: 45.h,
        decoration: const BoxDecoration(
          color: MyColors.alternative100,
          shape: BoxShape.circle,

        ),
      ),
      SizedBox(width: 11.w,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${notifier.thistudents[index].last_name} ${notifier.thistudents[index].first_name}'),
          Row(
            children: [
              SvgPicture.asset('assets/image/star.svg'),
              SizedBox(width: 5.w,),
              Text('28 Звездочек',style: FontStylization.littleStyle,),
            ],
          ),
        ],
      )
    ],);
  }
}


class FilterField extends StatelessWidget {
  const FilterField({super.key});
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<GroupStudentNotifier>();
    return Center(
      child: SizedBox(
        width: 335.w,
        height: 42.h,
        child: CupertinoTextField(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          prefix: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: SvgPicture.asset(
              "assets/image/search.svg",
              width: 14.w,
              height: 14.h,
            ),
          ),
           suffix: GestureDetector(
            onTap: () => showModalBottomSheet<dynamic>(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(38),
                      topRight: Radius.circular(38))),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return  
                ChangeNotifierProvider(
                  create: (context) => FilterStudentGroupNotifier(),
                  child: const Banner()
                );
              },
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(
                "assets/image/filter.svg",
                width: 22.w,
                height: 22.h,
              ),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onChanged: (value) {
            notifier.searchProfile(value, notifier.students);
          },
          placeholder: "Фильтровать",
          placeholderStyle: FontStylization.subTitleSora,
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.neutral200),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          
        ),
      ),
    );
  }
}


class Banner extends StatelessWidget {
  const Banner({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
                     decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(38), topRight: Radius.circular(38))),
              child: Padding(
                padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                            height: 12.h,
                            
                          ),
                          Center(child: SvgPicture.asset('assets/image/top_panel.svg')),
                          SizedBox(
                            height: 25.h,
                          ),
                           Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                "Фильтр",
                style: FontStylization.subAlert_title_text,
                            ),
                          ),
                          SizedBox(
                            height: 37.h,
                          ),
                          AgeGteField(),
                           SizedBox(
                            height: 15.h,
                          ),
                          AgeGteField(),
                          SizedBox(
                            height: 101.h,
                          ),
                          Center(
                            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropButton(),
                  SizedBox(width: 13.w,),
                  AcceptButton()
                ],
                            ),
                          ),
                           SizedBox(
                            height: 30.h,
                          ),
                  ],
                ),
              ),
                  );
  }
}



class AcceptButton extends StatelessWidget {
  const AcceptButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterStudentGroupNotifier>();
    return Center(
      child: SizedBox(
        width: 183.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => notifier.save(context),style: ButtonStyle(backgroundColor:
         const MaterialStatePropertyAll(MyColors.primary700),
         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)))), 
         child: Text('Принять',style: FontStylization.buttonTxtStyle,),)),
    );
  }
}

class DropButton extends StatelessWidget {
  const DropButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterStudentGroupNotifier>();
    return Center(
      child: SizedBox(
        width: 131.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => notifier.dropFilter(context),style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(Colors.white),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5),side: const BorderSide(color: MyColors.primary700)))), child: Text('Сбросить',style: FontStylization.activeButtonTxtStyle,),)),
    );
  }
}



class AgeGteField extends StatelessWidget {
  const AgeGteField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterStudentGroupNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: TextFormField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            notifier.age_gte = value;
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
            hintText: "Возраст от",
            hintStyle: FontStylization.fieldStyle,
          ),
        ),
      ),
    );
  }
}

class AgeLteField extends StatelessWidget {
  const AgeLteField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterStudentGroupNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: TextFormField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            notifier.age_lte = value;
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
            hintText: "Возраст до",
            hintStyle: FontStylization.fieldStyle,
          ),
        ),
      ),
    );
  }
}