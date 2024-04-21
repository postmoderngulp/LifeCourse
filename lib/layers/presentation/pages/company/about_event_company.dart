// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hac/layers/presentation/pages/company/participants_company.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';
import 'package:provider/provider.dart';

import 'package:hac/layers/presentation/notifiers/company/about_company_notifier.dart';

class AboutCompany extends StatelessWidget {
  int event_id;
   AboutCompany({
    Key? key,
    required this.event_id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => AboutCompanyNotifier(event_id: event_id),child: const SubAboutCompany(),);
  }
}


class SubAboutCompany extends StatelessWidget {
  const SubAboutCompany({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier  = context.watch<AboutCompanyNotifier>();
    return Container( 
      color: Colors.white, 
      child: SafeArea(child: Scaffold( 
        body: SingleChildScrollView( 
          physics: const BouncingScrollPhysics(), 
          child: SingleChildScrollView(
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
                       SizedBox(width: 15.w,),
                 Text(notifier.MyEvent != null ? notifier.MyEvent!.name: 'Мастер класс',style: FontStylization.littleTitle,),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 18.w,right: 34.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Описание',style: FontStylization.titleInfo,),
                       SizedBox(
                    height: 17.h,
                  ),
                      Text(notifier.MyEvent != null ? notifier.MyEvent!.description : ''),
                       SizedBox(
                    height: 26.h,
                  ),
                      Text('Дата',style: FontStylization.titleInfo,),
                       SizedBox(
                    height: 12.h,
                  ),
                      Text('${notifier.MyEvent != null ? notifier.MyEvent!.date : '' }'),
                       SizedBox(
                    height: 17.h,
                  ),
                      Text('Категория',style: FontStylization.titleInfo),
                       SizedBox(
                    height: 17.h,
                  ),
                  Wrap(
                    children: List.generate(notifier.skills.length, (index) =>  Padding(
                      padding:  EdgeInsets.only(right: 13.w,bottom: 10.h),
                      child: Container(
                          width: 90.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(46),
                            color: MyColors.primary100,
                                
                          ),
                          child: Center(child: Text(notifier.skills[index].name,style: FontStylization.typeText,)),
                        ),
                    ),),
                  ),
                  SizedBox(height: 100.h,),
                  Center(
                     child: SizedBox(
                      height: 42.h,
                      child: ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ParticipantCompany(event_id:notifier.event_id ,))), style: ButtonStyle(
                        backgroundColor:  MaterialStatePropertyAll( MyColors.primary700),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
                      ),child: Text('Участники',style:  FontStylization.addToMcBig,)),
                                       ),
                   )
                    ],
                  ),
                )
              ], 
            ),
          ), 
        ), 
      )), 
    );;

  }
}



