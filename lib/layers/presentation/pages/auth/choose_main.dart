import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hac/layers/presentation/notifiers/auth/choose_notifier.dart';
import 'package:hac/layers/presentation/pages/auth/sign_up_student.dart';
import 'package:hac/layers/presentation/pages/company/main_company.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';
import 'package:provider/provider.dart';

class ChooseMain extends StatelessWidget {
  const ChooseMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ChooseNotifier(), child: const SubChooseMain(),);
  }
}



class SubChooseMain extends StatelessWidget {
  const SubChooseMain({super.key});

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
              SizedBox(height: 160.h,),
              const Logo(),
              SizedBox(height: 142.h,),
              const StudentButton(),
              SizedBox(height: 25.h,),
              const CompanyButton()
            ],
          ),
        ),
      )),
    );
  }
}



class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/image/logo.svg'),
    );
  }
}


class VusButton extends StatelessWidget {
  const VusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 248.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () {},style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(MyColors.primary700),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)))), child: Text('ВУЗам',style: FontStylization.buttonTxtStyle,),)),
    );
  }
}


class StudentButton extends StatelessWidget {
  const StudentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 248.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpStudent())),style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(MyColors.primary700),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)))), child: Text('Студентам',style: FontStylization.buttonTxtStyle,),)),
    );
  }
}

class CompanyButton extends StatelessWidget {
  const CompanyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 248.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainCompany(selectIndex: 0))),style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(MyColors.primary700),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)))), child: Text('Предприятиям',style: FontStylization.buttonTxtStyle,),)),
    );
  }
}