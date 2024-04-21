import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hac/layers/presentation/notifiers/student/student_faculty_notifier.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';
import 'package:provider/provider.dart';

class StudentFaculty extends StatelessWidget {
  const StudentFaculty({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => StudentFacultyNotifier(),child: const SubStudentFaculty(),);
  }
}


class SubStudentFaculty extends StatelessWidget {
  const SubStudentFaculty({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StudentFacultyNotifier>();
    return Container( 
      color: Colors.white, 
      child: SafeArea(child: Scaffold( 
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
               Text(notifier.faculty,style: FontStylization.littleTitle,),
                ],
              ),
              SizedBox(height: 26.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Описание',style: FontStylization.titleInfo,),
                SizedBox(height: 26.h,),
                Text(notifier.description,style: FontStylization.titleInfo,),
                SizedBox(height: 26.h,),
                 Text('Приоритетные мероприятия',style: FontStylization.titleInfo,),
                 SizedBox(height: 16.h,),
                Text('Подходящие профессии',style: FontStylization.titleInfo,),
                   SizedBox(height: 16.h,),
                  ],
                ),
              )
              
            ],  
          ), 
        ), 
      )), 
    );

  }
}