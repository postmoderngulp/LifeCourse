
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hac/layers/presentation/notifiers/company/event_company_notifier.dart';
import 'package:hac/layers/presentation/notifiers/company/filter_company_notifier.dart';
import 'package:hac/layers/presentation/pages/company/about_event_company.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EventCompany extends StatelessWidget {
  const EventCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => EventCompanyNotifier(),child: const SubEventsCompany(),);
  }
}


class SubEventsCompany extends StatelessWidget {
  const SubEventsCompany({super.key});

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
               const FilterField(),
               SizedBox(height: 16.h,),
              const MasterClass(),
            ], 
          ), 
        ), 
      )), 
    );

  }
}



class MasterClass extends StatelessWidget {
  const MasterClass({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<EventCompanyNotifier>();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: notifier.myEvents.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => Padding(
        padding:  EdgeInsets.only(bottom: 8.h,left: 16.w,right: 16.w),
        child: MasterCLassItem(index: index),
      ),);
  }
}


class MasterCLassItem extends StatelessWidget {
  int index;
  MasterCLassItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<EventCompanyNotifier>();
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  AboutCompany(event_id: notifier.myEvents[index].id,))),
      child: Container(
        width: 335.w,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: MyColors.neutral300,
              blurRadius: 1
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
      
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 13.h,),
              Text(notifier.myEvents[index].name,style: FontStylization.mcStyle,),
              SizedBox(height: 11.h,),
              Row(
                children: [
                  SvgPicture.asset('assets/image/calendar.svg'),
                  SizedBox(width: 8.w,),
                  Text(notifier.myEvents[index].date,style: FontStylization.date,)
                ],
              ),
              SizedBox(height: 15.h,),
              Row(
                children: [
                  Container(
                    width: 62.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(46),
                      color: MyColors.primary100,
          
                    ),
                    child: Center(child: Text('Спорт',style: FontStylization.typeText,)),
                  ),
                  const Spacer(),
                  
                ],
              ),
              SizedBox(height: 13.h,),
            ],
          ),
        ),
      ),
    );
  }
}




class FilterField extends StatelessWidget {
  const FilterField({super.key});
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<EventCompanyNotifier>();
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
                return  ChangeNotifierProvider(create: ( context) => FilterCompanyNotifier(),
                child: const Banner());
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
            // notifier.searchProfile(value, notifier.events);
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
              child: SingleChildScrollView(
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
                            CategoryField(),
                             SizedBox(
                              height: 15.h,
                            ),
                            DateField(),
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
              ),
                  );
  }
}



class DateField extends StatelessWidget {
  const DateField({super.key});

  @override
  Widget build(BuildContext context) {
    var dateMaskFormatter = MaskTextInputFormatter(mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')});
    final notifier = context.watch<FilterCompanyNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [dateMaskFormatter],
          onChanged: (value) {
            notifier.dob = value;
            if(notifier.dob.length == 10) notifier.setDobValide(notifier.dob);
          } ,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding:  EdgeInsets.all(15.w),
              child: SvgPicture.asset('assets/image/calendar.svg',colorFilter: const ColorFilter.mode(MyColors.neutral400, BlendMode.srcIn),),
            ),
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
            hintText: "Дата",
            hintStyle: FontStylization.fieldStyle,
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
    final notifier = context.watch<FilterCompanyNotifier>();
    return Center(
      child: SizedBox(
        width: 183.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => notifier.saveFilter(context),style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(MyColors.primary700),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)))), child: Text('Принять',style: FontStylization.buttonTxtStyle,),)),
    );
  }
}

class DropButton extends StatelessWidget {
  const DropButton({super.key});

  @override
  Widget build(BuildContext context) {
     final notifier = context.watch<FilterCompanyNotifier>();
    return Center(
      child: SizedBox(
        width: 131.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => notifier.dropFilter(context),style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(Colors.white),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5),side: const BorderSide(color: MyColors.primary700)))), child: Text('Сбросить',style: FontStylization.activeButtonTxtStyle,),)),
    );
  }
}


class CategoryField extends StatefulWidget {
  const CategoryField({super.key});

  @override
  State<CategoryField> createState() => _CategoryFieldState();
}

class _CategoryFieldState extends State<CategoryField> {
   final dropValue = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FilterCompanyNotifier>();
    
   
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
                      'Категория',
                      style: FontStylization.fieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                    notifier.categoty = choice.toString();
                  },
                  items: 
                      notifier.categories.map((e) => DropdownMenuItem(
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