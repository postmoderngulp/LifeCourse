import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hac/layers/presentation/notifiers/student/create_event_student_notifier.dart';
import 'package:hac/layers/presentation/style/colors.dart';
import 'package:hac/layers/presentation/style/fontstyle.dart';
import 'package:provider/provider.dart';

class CreateEventStudent extends StatelessWidget {
  const CreateEventStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => CreateEventStudentNotifier(), child: const SubCreateStudent(),);
  }
}


class SubCreateStudent extends StatelessWidget {
  const SubCreateStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<CreateEventStudentNotifier>();
    return Container( 
      color: Colors.white, 
      child: SafeArea(child: Scaffold( 
        body: SingleChildScrollView( 
          physics: const BouncingScrollPhysics(), 
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [ 
               Padding(
                 padding:  EdgeInsets.only(left: 10.w,top: 10.w),
                 child: Row(
                  children: [
                      const BackButton(),
                      SizedBox(width: 10.w,),
                      Text('Создание публикации',style: FontStylization.title,)
                 
                  ],
                 ),
               ),
               SizedBox(height: 31.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 GestureDetector(
                  onTap: () => notifier.chooseImage(),
                   child: Padding(
                     padding:  EdgeInsets.only(left: 25.w),
                     child: notifier.bytes != null ? Container(
                      width: 130.w,
                        height: 130.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(image: MemoryImage(notifier.bytes as Uint8List),fit: BoxFit.cover)
                        ),
                     ) : SvgPicture.asset('assets/image/no_avatar_event.svg'),
                   ),
                 ),
                 SizedBox(height: 24.h,),
                const ChapterField(),
                 SizedBox(height: 24.h,),
                 const DescriptionField(),
                 SizedBox(height: 199.h,),
                  const CreateButton(),
                 SizedBox(height: 38.h,),
                  ],
                 ),
            ], 
          ), 
        ), 
      )), 
    );
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 261.w,
        height: 46.h,
        child: ElevatedButton(onPressed: () => Navigator.of(context).pop(),style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(MyColors.primary700),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)))), child: Text('Создать',style: FontStylization.buttonTxtStyle,),)),
    );
  }
}

class DescriptionField extends StatelessWidget {
  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<CreateEventStudentNotifier>();
    return Center(
      child: SizedBox(
        width: 320.w,
        height: 115.h,
        child: CupertinoTextField(
        onChanged: (value)  => notifier.description = value,
        padding: EdgeInsets.only(left: 14.w, top: 14.h),
        placeholder: "Описание",
        placeholderStyle: FontStylization.fieldStyle,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.top,
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.neutral500),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      ),
    );
  }
}



class ChapterField extends StatelessWidget {
  const ChapterField({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<CreateEventStudentNotifier>();
    
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
                      'Группа',
                      style: FontStylization.inputfieldStyle,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (choice) {
                    dropValue.value = choice.toString();
                   notifier.chapter = choice as String;
                  },
                  items: notifier.chapterList
                      .map((e) => DropdownMenuItem(
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