
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hac/layers/data/models/filter.dart';
import 'package:hac/layers/presentation/notifiers/student/filter_rating_notifier.dart';
import 'package:hac/layers/presentation/notifiers/student/rating_students_notifier.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';
import 'package:provider/provider.dart';

class RatingStudent extends StatelessWidget {
   RatingStudent({super.key});

  Filter? filter;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => RatingStudentsNotifier(),child: const SubRatingStudents(),);
  }
}

class SubRatingStudents extends StatelessWidget {
  const SubRatingStudents({super.key});

  @override
  Widget build(BuildContext context) {
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
                 SizedBox(height: 28.h,),
                 const FilterField(),
                 SizedBox(height: 27.h,),
                 const Rating()
              ], 
            ),
          ), 
        ), 
      )), 
    );
  }
}


class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<RatingStudentsNotifier>();
    return ListView.builder(
      itemCount: notifier.ratings.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => Padding(
        padding:  EdgeInsets.symmetric(horizontal: 9.w),
        child: RatingItem(index: index),
      ),);
  }
}

class RatingItem extends StatelessWidget {
  int index;
   RatingItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<RatingStudentsNotifier>();
    return Container(
      decoration: BoxDecoration(border: Border.all(color: MyColors.neutral400)),
      width: MediaQuery.of(context).size.width.w,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('${index+1} ${notifier.ratings[index].name}',style: FontStylization.littleBlackTxt,),
                const Spacer(),
                Padding(
                  padding:  EdgeInsets.only( top: 12.h),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: MyColors.neutral200)
                    ),
                    width: 30.w,
                    height: 30.h,
                    child: Padding(
                      padding:  EdgeInsets.all(8.w),
                      child: SvgPicture.asset('assets/image/arrow_right.svg'),
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(height: 2.5.h,),
             Row(
              children: [
                SvgPicture.asset('assets/image/star.svg'),  
                SizedBox(width: 5.w,),
                Text('${notifier.ratings[index].stars} звездочек',style: FontStylization.ratingStudentStyle,)
              ],
             ),
             SizedBox(height: 15.h,),
             Text("",style: FontStylization.vusStyle,),
             SizedBox(height: 15.h,),
          ],
        ),
      ),
    );
  }
}

class FilterField extends StatelessWidget {
  const FilterField({super.key});
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<RatingStudentsNotifier>();
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
                  create: (context) => FilterStudentRatingNotifier(),
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
            notifier.nickname = value;
            notifier.searchProfile(value,notifier.students);
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
                  );
  }
}


class AcceptButton extends StatelessWidget {
  const AcceptButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterStudentRatingNotifier>();
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
    final notifier = context.watch<FilterStudentRatingNotifier>();
    return Center(
      child: SizedBox(
        width: 131.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => notifier.dropFilter(context),style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(Colors.white),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5),side: const BorderSide(color: MyColors.primary700)))), child: Text('Сбросить',style: FontStylization.activeButtonTxtStyle,),)),
    );
  }
}


class CityField extends StatefulWidget {
  const CityField({super.key});

  @override
  State<CityField> createState() => _CityFieldState();
}

class _CityFieldState extends State<CityField> {
  
  final dropValue = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterStudentRatingNotifier>();
    
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


class VusField extends StatefulWidget {
  const VusField({super.key});

  @override
  State<VusField> createState() => _VusFieldState();
}

class _VusFieldState extends State<VusField> {
  final dropValue = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterStudentRatingNotifier>();
    
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
    final notifier = context.watch<FilterStudentRatingNotifier>();
    
    
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
                    for(int i = 0; i< notifier.vusList.length;i++){
                      if(notifier.vusList[i].name == notifier.vus){
                        notifier.getCaf(notifier.vusList[i].id);
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
    final notifier = context.watch<FilterStudentRatingNotifier>();
    
    
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
                    for(int i = 0; i< notifier.vusList.length;i++){
                      if(notifier.vusList[i].name == notifier.vus){
                        notifier.getGroup(notifier.vusList[i].id);
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
    final notifier = context.watch<FilterStudentRatingNotifier>();
    
    
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


