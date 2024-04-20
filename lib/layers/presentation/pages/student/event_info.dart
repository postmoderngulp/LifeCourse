import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hac/layers/presentation/notifiers/student/event_info_student_notifier.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';
import 'package:provider/provider.dart';

class InfoEventStudent extends StatelessWidget {
  const InfoEventStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> EventInfoStudentNotifier(),child: const SubInfoEventStudent(),);
  }
}


class SubInfoEventStudent extends StatelessWidget {
  const SubInfoEventStudent({super.key});

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
                     SizedBox(width: 15.w,),
               Text('Публикация',style: FontStylization.littleTitle,),
               const Spacer(),
               SvgPicture.asset('assets/image/more.svg'),
               SizedBox(width: 9.w,),
                ],
              ),
                 Column(
        children: [
          SizedBox(height: 40.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
            Padding(
              padding:  EdgeInsets.only(left: 5.w,right: 15.w),
              child: Container(
                width: 45.w,
                height: 45.h,
                decoration: const BoxDecoration(color: MyColors.neutral200,shape: BoxShape.circle),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alex Lee'),
                Text('ОГУ',style: FontStylization.vusStyle,)
              ],
            ),
            Spacer(),
            Text('03 сентября 13:00',style: FontStylization.date,),
            SizedBox(width: 15.w,)
          ],),
          SizedBox(height: 5.5.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 11.w),
            child: Text('Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.',style: FontStylization.littleBlackTxt,),
          ),
          SizedBox(height: 18.h,),
          Container(
            width: 375.w,
            height: 375.h,
            decoration: const BoxDecoration(
              color: MyColors.neutral100
            ),
          ),
          const SizedBox(height: 9,),
          const Actions(),
        ],
      ),
              
            ], 
          ), 
        ), 
      )), 
    );

  }
}


class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 7.w,),
        const Like(),
        const Spacer(),
        const Type(),
        SizedBox(width: 25.w,),
      ],
    );
  }
}


class Like extends StatelessWidget {
  const Like({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<EventInfoStudentNotifier>();
    return SizedBox(
      height: 30.h,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor:  MaterialStatePropertyAll(notifier.isLike ? MyColors.danger100 : MyColors.neutral100),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))
        ),
        onPressed: () => notifier.setLike(), child: Row(
        children: [
          notifier.isLike ? SvgPicture.asset('assets/image/active_like.svg') :  SvgPicture.asset('assets/image/like.svg'),
          SizedBox(width: 5.w,),
          Text('252',style:  notifier.isLike ? FontStylization.likeActiveText : FontStylization.likeText,)
        ],
      )),
    );
  }
}


class Type extends StatelessWidget {
  const Type({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: const MaterialStatePropertyAll(MyColors.neutral100),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))
        ),
        onPressed: (){}, child: Row(
        children: [
          Text('Спорт',style: FontStylization.typeText,)
        ],
      )),
    );
  }
}