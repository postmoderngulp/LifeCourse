// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hac/layers/presentation/notifiers/student/filter_main_notifier.dart';
import 'package:provider/provider.dart';
import 'package:hac/layers/presentation/notifiers/student/main_screen_student_notifier.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';

class MainScreenStudent extends StatelessWidget {
  const MainScreenStudent ({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => MainScreenStudentNotifier(),child: const SubMainScreenStudent(),);
  }
}


class SubMainScreenStudent extends StatelessWidget {
  const SubMainScreenStudent({super.key});

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
              SizedBox(height: 28.h,),
                const SearchField(),
                SizedBox(height: 20.h,),
                const Tape(),
            ], 
          ), 
        ), 
      )), 
    );
 
  }
}


class SearchField extends StatelessWidget {
  const SearchField({super.key});
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<MainScreenStudentNotifier>();
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
                return ChangeNotifierProvider(
                  create: (context) => FilterMainNotifier(),
                  child: Container(
                     decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(38), topRight: Radius.circular(38))),
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
          CityField(),
           SizedBox(
            height: 15.h,
          ),
          VusField(),
          SizedBox(
            height: 15.h,
          ),
          FacField(),
          SizedBox(
            height: 15.h,
          ),
          CafField(),
          SizedBox(
            height: 15.h,
          ),
          GroupField(),
          SizedBox(
            height: 15.h,
          ),
          ChapterField(),
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
                  )
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
          onChanged: (value) {},
          placeholder: "Найти событие",
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



class AcceptButton extends StatelessWidget {
  const AcceptButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 183.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => null,style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(MyColors.primary700),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)))), child: Text('Принять',style: FontStylization.buttonTxtStyle,),)),
    );
  }
}

class DropButton extends StatelessWidget {
  const DropButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 131.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () {},style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(Colors.white),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5),side: const BorderSide(color: MyColors.primary700)))), child: Text('Сбросить',style: FontStylization.activeButtonTxtStyle,),)),
    );
  }
}

class CityField extends StatelessWidget {
  const CityField({super.key});
 
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterMainNotifier>();
    
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
                      'Город',
                      style: FontStylization.fieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                    notifier.city = choice as String;
                  },
                  items: 
                      notifier.cities.map((e) => DropdownMenuItem(
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
    final notifier = context.watch<FilterMainNotifier>();
    
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
                      'Вуз',
                      style: FontStylization.fieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                    notifier.vus = choice as String;
                  },
                  items: 
                      notifier.vuses.map((e) => DropdownMenuItem(
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

class FacField extends StatelessWidget {
  const FacField({super.key});
 
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterMainNotifier>();
    
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
                      'Факультет',
                      style: FontStylization.fieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                    notifier.fac = choice as String;
                  },
                  items: 
                      notifier.facs.map((e) => DropdownMenuItem(
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



class CafField extends StatelessWidget {
  const CafField({super.key});
 
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterMainNotifier>();
    
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
                      'Кафедра',
                      style: FontStylization.fieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                    notifier.caf = choice as String;
                  },
                  items: 
                      notifier.cafs.map((e) => DropdownMenuItem(
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

class GroupField extends StatelessWidget {
  const GroupField({super.key});
 
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterMainNotifier>();
    
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
                      'Группы',
                      style: FontStylization.fieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                    notifier.group = choice as String;
                  },
                  items: 
                      notifier.groups.map((e) => DropdownMenuItem(
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


class ChapterField extends StatelessWidget {
  const ChapterField({super.key});
 
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterMainNotifier>();
    
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
                      'Разделы',
                      style: FontStylization.fieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                    notifier.chapter = choice as String;
                  },
                  items: 
                      notifier.chapters.map((e) => DropdownMenuItem(
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

class Tape extends StatelessWidget {
  const Tape({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => Padding(
        padding:  EdgeInsets.only(bottom: 14.h),
        child: TapeItem(index: index),
      ),);
  }
}



class TapeItem extends StatelessWidget {
  int index;
  TapeItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width.w,
      height: 583.h,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: MyColors.neutral300,
            blurRadius: 1
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          SizedBox(height: 15.h,),
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
    final notifier = context.watch<MainScreenStudentNotifier>();
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