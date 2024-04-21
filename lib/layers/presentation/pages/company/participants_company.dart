// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:provider/provider.dart';
import 'package:hac/layers/presentation/notifiers/company/participant_company_notifier.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';

class ParticipantCompany extends StatelessWidget {
  int event_id;
  ParticipantCompany({
    super.key,
    required this.event_id,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ParticipantCompanyNotifier(event_id: event_id),child: const SubPartisipantCompany(),);
  }
}

class SubPartisipantCompany extends StatelessWidget {
  const SubPartisipantCompany({super.key});

  @override
  Widget build(BuildContext context) {
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
               Text('Участники',style: FontStylization.littleTitle,),
                ],
              ),
              SizedBox(height: 20.h,),
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
     final notifier = context.watch<ParticipantCompanyNotifier>();
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
     final notifier = context.watch<ParticipantCompanyNotifier>();
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

