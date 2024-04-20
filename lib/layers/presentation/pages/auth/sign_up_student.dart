import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hac/layers/presentation/notifiers/auth/sign_up_student_notifier.dart';
import 'package:hac/layers/presentation/pages/auth/sign_in.dart';
import 'package:hac/layers/presentation/pages/auth/sign_up_student2.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SignUpStudent extends StatelessWidget {
  const SignUpStudent({super.key});

  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(create: (BuildContext context) => SignUpStudentNotifier(),
    child: const SubSignUpStudent(),);
  }
}


class SubSignUpStudent extends StatelessWidget {
  const SubSignUpStudent ({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpStudentNotifier>();
    return Container(
      color: Colors.white,
      child: SafeArea(child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
              padding: EdgeInsets.only(left: 20.w, top: 25.h),
              child: const Align(
                  alignment: Alignment.topLeft, child: BackButton()),
            ),
            SizedBox(height: 25.h,),
              Padding(
                padding:  EdgeInsets.only(left: 30.w),
                child: Text('Регистрация студента',style: FontStylization.title,),
              ),
               SizedBox(height: 40.h,),
               GestureDetector(
                onTap: () => notifier.chooseImage(),
                 child: Padding(
                   padding:  EdgeInsets.only(left: 28.w),
                   child: notifier.bytes != null ? Container(
                    width: 146.w,
                      height: 146.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: MemoryImage(notifier.bytes as Uint8List),fit: BoxFit.cover)
                      ),
                   ) : SvgPicture.asset(
                      "assets/image/noImage.svg",
                      width: 146.w,
                      height: 146.h,
                    ),
                 ),
               ),
               SizedBox(height: 45.h,),
               const FioField(),
  SizedBox(height: 20.h,),
  const EmailField(),
  SizedBox(height: 20.h,),
  const PasswordField(),
  SizedBox(height: 95.h,),
  const NextButton(),
  SizedBox(height: 20.h,),
  Center(
    child: GestureDetector(
      onTap: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignIn()),(r) => false),
      child: Text('Есть аккаунт? Войти',style: FontStylization.littleMainTxt,)),
  ),
  SizedBox(height: 20.h,),
            ],
          ),
        ),
      )),
    );
  }
}




class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpStudentNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: TextFormField(
          obscureText: notifier.isObscure,
          onChanged: (value) {
            notifier.password = value;
            notifier.setPasswordValidate(notifier.password);
          } ,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: (() {
                notifier.setObscure();
              }),
              child: Padding(
                padding:  EdgeInsets.all(13.w),
                child: SvgPicture.asset('assets/image/eye.svg'),
              ),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            filled: true,
            fillColor: Colors.white,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.neutral500, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.neutral500, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.neutral500, width: 1)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.neutral500, width: 1),
                borderRadius: BorderRadius.circular(10.0)),
            hintText: "Пароль",
            hintStyle: FontStylization.fieldStyle,
          ),
        ),
      ),
    );
  }
}



class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: SvgPicture.asset(
          "assets/image/arrow-left.svg",
          width: 22.w,
          height: 22.h,
        ));
  }
}

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpStudentNotifier>();
    return Center(
      child: SizedBox(
        width: 245.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => notifier.registerStudent(notifier.fio, notifier.email,notifier.password, '', context),style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(MyColors.primary700),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)))), child: Text('Далее',style: FontStylization.buttonTxtStyle,),)),
    );
  }
}

class FioField extends StatelessWidget {
  const FioField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpStudentNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: TextFormField(
          onChanged: (value) {
            notifier.fio = value;
          } ,
          decoration: InputDecoration(
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
            hintText: "ФИО",
            hintStyle: FontStylization.fieldStyle,
          ),
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpStudentNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: TextFormField(
          onChanged: (value) {
            notifier.email = value;
          } ,
          decoration: InputDecoration(
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
            hintText: "Электронная почта",
            hintStyle: FontStylization.fieldStyle,
          ),
        ),
      ),
    );
  }
}