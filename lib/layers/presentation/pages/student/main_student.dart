import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hac/layers/presentation/pages/student/events_student.dart';
import 'package:hac/layers/presentation/pages/student/main_screen_student.dart';
import 'package:hac/layers/presentation/pages/student/profile_student.dart';
import 'package:hac/layers/presentation/pages/student/rating_student.dart';
import 'package:hac/layers/presentation/style/colors.dart';

class MainStudent extends StatefulWidget {
  int selectIndex = 0;
   MainStudent({super.key});

  @override
  State<MainStudent> createState() => _MainStudentState();
}

class _MainStudentState extends State<MainStudent> {
  final List<Widget> _tabs = [
    const MainScreenStudent(),
    const RatingStudent(),
    const EventsStudent(),
    const ProfileStudent()
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
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/image/profile.svg',
                  colorFilter: ColorFilter.mode(
                      widget.selectIndex == 3 ? MyColors.primary700 : MyColors.neutral300,
                      BlendMode.srcIn),
                ),
                label: 'Профиль',
              ),
            ],
          ),
      ),
    );
  }
}