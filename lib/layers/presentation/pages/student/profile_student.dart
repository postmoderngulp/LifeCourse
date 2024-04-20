import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hac/layers/presentation/notifiers/student/profile_notifier.dart';
import 'package:hac/layers/presentation/pages/student/create_event_student.dart';
import 'package:hac/layers/presentation/pages/student/event_info.dart';
import 'package:hac/layers/presentation/pages/student/student_redact.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProfileStudent extends StatelessWidget {
  const ProfileStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ProfileNotifier(), child: const SubProfileStudent(),);
  }
}


class SubProfileStudent extends StatefulWidget {
  const SubProfileStudent({super.key});

  @override
  State<SubProfileStudent> createState() => _SubProfileStudentState();
}

class _SubProfileStudentState extends State<SubProfileStudent> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
               SizedBox(height: 15.h,),
               Row(
                 children: [
                  const Spacer(),
                   GestureDetector
                   
                   (
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StudentRedact())),
                    child: SvgPicture.asset('assets/image/redact.svg')),
                    SizedBox(width: 15.w,),
                 ],
               ),
               Center(
                  child: false ? Container(
                    width: 117.w,
                    height: 117.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,),
                  ) : Shimmer.fromColors(
                    highlightColor: MyColors.neutral150,
                    baseColor: Colors.white,
                    child: Container(
                      width: 117.w,
                      height: 117.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.neutral500,),
                    ),
                  ),
                ),
                SizedBox(height: 15.h,),
                 Center(child: Text('Катя Клуша',style: FontStylization.title,)),
                SizedBox(height: 7.h,),
                 Center(child: Text('Оренбургский государственный университет',style: FontStylization.ratingStyle,)),
                SizedBox(height: 29.h,),
                TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    labelColor: Colors.white,
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelStyle: FontStylization.second_text,
                    unselectedLabelColor: Colors.grey,
                    indicator: const BoxDecoration(
                        color: MyColors.primary700,
                        borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                    tabs: const [
                      Tab(
                        text: "Обо мне",
                        
                      ),
                      Tab(
                        text: "Публикации",
                      ),
                    ]),
                SizedBox(
                  height: 500.h,
                  child: TabBarView(
                    controller: _tabController,
                    children: const <Widget>[
                      AboutMe(),
                       Pubications(),
                    ],
                  ),
                ),
              
            ], 
          ), 
        ), 
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100))),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateEventStudent())),backgroundColor: MyColors.primary700,child: const Icon(Icons.add,color: Colors.white,),),
      )), 
    );

  }
}



class Pubications extends StatelessWidget {
  const Pubications({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                         child: Column(
                          children: [
                            Wrap(
                              direction: Axis.horizontal,
                              children: List.generate(14, (index) =>  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InfoEventStudent())),
                                  child: Container(width: 100.w,height: 100.h,color: MyColors.neutral300,)),
                              )),)
                          ],
                                               ),
                       );
  }
}


class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 26.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                SizedBox(height: 27.h,),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/image/star.svg'),
                                      SizedBox(width: 5.w,),
                                       Text('28 звездочек',style: FontStylization.ratingStyle,)
                                    ],
                                  ),
                                ),
                                 SizedBox(height: 17.h,),
                                  Text('Обо мне',style:FontStylization.titleInfo ,),
                                  SizedBox(height: 17.h,),
                                  const Text('Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.'),
                                  SizedBox(height: 17.h,),
                                   Text('Факультет',style:FontStylization.titleInfo ,),
                                  SizedBox(height: 17.h,),
                                   Text('Архитектурно-строительный факультет',style: FontStylization.littleMainTxt,),
                                  SizedBox(height: 17.h,),
                                    Text('Кафедра',style:FontStylization.titleInfo ,),
                                  SizedBox(height: 17.h,),
                                   Text('Кафедра строительных конструкций',style: FontStylization.littleMainTxt,),
                                  SizedBox(height: 17.h,),
                                   Text('Группа',style:FontStylization.titleInfo ,),
                                  SizedBox(height: 17.h,),
                                   Text('23Стр(б)-3',style: FontStylization.littleMainTxt,),
                                  SizedBox(height: 19.h,),
                                  const LogOutButton()
                            ],
                          ),
      ),
    );
  }
}



class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<ProfileNotifier>();
    return SizedBox(
      width: 104.w,
      height: 36.h,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: const MaterialStatePropertyAll(MyColors.danger100),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
        ),
        onPressed: () => notifier.logOut(context), child: Row(
        children: [
          SvgPicture.asset('assets/image/logout.svg'),
          SizedBox(width: 5.w,),
          Text('Выйти',style: FontStylization.errorStyle,)
        ],
      )),
    );
  }
}