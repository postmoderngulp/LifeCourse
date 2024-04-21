// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hac/layers/data/models/event.dart';
import 'package:hac/layers/data/models/eventss.dart';
import 'package:provider/provider.dart';

import 'package:hac/layers/presentation/notifiers/student/about_event_notifier.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';

class AboutEvent extends StatelessWidget {
  event myEvent;
  AboutEvent({
    Key? key,
    required this.myEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => AboutEventNotifier(myEvent: myEvent),child: const SubAboutEvent(),);
  }
}


class SubAboutEvent extends StatelessWidget {
  const SubAboutEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier  = context.watch<AboutEventNotifier>();
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
                 Text(notifier.myEvent != null ? notifier.myEvent!.name: 'Мастер класс',style: FontStylization.littleTitle,),
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
                      Text('${notifier.myEvent != null ? notifier.myEvent!.description : ''}'),
                       SizedBox(
                    height: 26.h,
                  ),
                      Text('Дата',style: FontStylization.titleInfo,),
                       SizedBox(
                    height: 12.h,
                  ),
                      Text('${notifier.myEvent != null ? notifier.myEvent!.date : '' }'),
                       SizedBox(
                    height: 17.h,
                  ),
                      Text('Категория',style: FontStylization.titleInfo),
                       SizedBox(
                    height: 17.h,
                  ),
                  Wrap(
                    children: List.generate(notifier.categories.length, (index) =>  Padding(
                      padding:  EdgeInsets.only(right: 13.w,bottom: 10.h),
                      child: Container(
                          width: 90.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(46),
                            color: MyColors.primary100,
                                
                          ),
                          child: Center(child: Text(notifier.categories[index].name,style: FontStylization.typeText,)),
                        ),
                    ),),
                  ),
                  SizedBox(height: 100.h,),
                   Center(
                     child: SizedBox(
                      height: 42.h,
                      child: ElevatedButton(onPressed: () => notifier.myEvent.requested  ?  null :notifier.sendApplication(notifier.myEvent!.id), style: ButtonStyle(
                        backgroundColor:  MaterialStatePropertyAll(notifier.myEvent.requested  ?  Colors.white :MyColors.primary700),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
                      ),child: Text(notifier.myEvent.requested  ?  'Заявка принята'  : 'Отправить заявку',style: notifier.myEvent.requested  ?  FontStylization.addToMcActive : FontStylization.addToMcBig,)),
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
    );

  }
}