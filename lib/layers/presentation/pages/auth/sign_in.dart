import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hac/layers/presentation/notifiers/auth/sign_in_notifier.dart';
import 'package:hac/layers/presentation/pages/auth/sign_up_student.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => SignInNotifier(),child: const SubSignIn(),);
  }
}


class SubSignIn extends StatelessWidget {
  const SubSignIn({super.key});

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
              SizedBox(height: 200.h,),
              Padding(
                padding:  EdgeInsets.only(left: 30.w),
                child: Text('Вход',style: FontStylization.title,),
              ),
               SizedBox(height: 24.h,), 
               const NicknameField(),
              SizedBox(height: 23.h,),
              const PasswordField(),
              SizedBox(height: 23.h,), 
              Padding(
                padding:  EdgeInsets.only(right: 30.w),
                child: GestureDetector(
                        // onTap: () => Navigator.of(context).pushNamed(NavigationRoutes.recoveryScreen),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Забыли пароль?",
                            style: FontStylization.littleStyle,
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 35.h,), 
              const SignInButton(),
              SizedBox(height: 220.h,), 
              const WithOutAcc(),
              SizedBox(height: 43.h,),
            ],
          ),
        ),
      )),
    );
  }
}



class WithOutAcc extends StatelessWidget {
  const WithOutAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return   Center(
                    child: TextButton(
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpStudent())),
                        child:  RichText(
                              text: TextSpan(
                                  text: 'Нет аккаунта?',
                                  style: FontStylization.littleBlackTxt,
                                  children: [
                                const TextSpan(text: '  '),
                                TextSpan(
                                  text: 'Зарегистрироваться',
                                  style: FontStylization.littleMainTxt,
                                ),
                              ])),
                        ),
                  );
  }
}


class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignInNotifier>();
    return Center(
      child: SizedBox(
        width: 245.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => notifier.signIn(notifier.nickname, notifier.password, context),style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(MyColors.primary700),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)))), child: Text('Войти',style: FontStylization.buttonTxtStyle,),)),
    );
  }
}



class NicknameField extends StatelessWidget {
  const NicknameField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignInNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: TextFormField(
          onChanged: (value) {
            notifier.nickname = value;
            notifier.setNicknameValidate(notifier.nickname);
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
            hintText: "Nickname",
            hintStyle: FontStylization.fieldStyle,
          ),
        ),
      ),
    );
  }
}


class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignInNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 50.h,
        child: TextFormField(
          onChanged: (value) {
            notifier.password = value;
            notifier.setPasswordValidate(notifier.nickname);
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
            hintText: "Пароль",
            hintStyle: FontStylization.fieldStyle,
          ),
        ),
      ),
    );
  }
}