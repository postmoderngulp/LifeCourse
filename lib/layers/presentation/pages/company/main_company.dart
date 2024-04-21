// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hac/layers/presentation/pages/company/event_company.dart';
import 'package:hac/layers/presentation/pages/company/main_screen_company.dart';
import 'package:hac/layers/presentation/pages/company/rating_company.dart';
import 'package:hac/layers/presentation/pages/student/events_student.dart';
import 'package:hac/layers/presentation/pages/student/main_screen_student.dart';
import 'package:hac/layers/presentation/pages/student/rating_student.dart';
import 'package:hac/layers/presentation/style/colors.dart';

class MainCompany extends StatefulWidget {
  int selectIndex = 0;
  MainCompany({
    Key? key,
    required this.selectIndex,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<MainCompany> createState() => _MainStudentState();
}

class _MainStudentState extends State<MainCompany> {

  

  
  final List<Widget> _tabs = [
    const MainScreenCompany(),
    const RatingCompany(),
    const EventCompany(),
  ];

  void tapBar(int index) {
    setState(() {
      widget.selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: _tabs[widget.selectIndex],
      bottomNavigationBar:  Theme(
          data: ThemeData(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            unselectedLabelStyle:  const TextStyle(color:  MyColors.neutral300,),
            backgroundColor: Colors.white,
            onTap: tapBar,
            currentIndex: widget.selectIndex,
            selectedItemColor: MyColors.primary700,
            unselectedItemColor: MyColors.neutral300,
            selectedLabelStyle: const TextStyle(color: MyColors.primary700),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/image/home.svg',
                  colorFilter: ColorFilter.mode(
                      widget.selectIndex == 0 ? MyColors.primary700 :  MyColors.neutral300,
                      BlendMode.srcIn),
                ),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/image/rating.svg',
                    colorFilter: ColorFilter.mode(
                        widget.selectIndex == 1
                            ? MyColors.primary700
                            :  MyColors.neutral300,
                        BlendMode.srcIn),
                  ),
                  label: 'Уведомления'),
                   BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/image/events.svg',
                    colorFilter: ColorFilter.mode(
                        widget.selectIndex == 2
                            ? MyColors.primary700
                            :  MyColors.neutral300,
                        BlendMode.srcIn),
                  ),
                  label: 'Мероприятия'),
            ],
          ),
      ),
    );
  }
}