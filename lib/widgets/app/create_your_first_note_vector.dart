import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils.dart';
import '../app_text.dart';

class CreateYourFirstNoteVector extends StatelessWidget {
  const CreateYourFirstNoteVector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Utils.getPNGAssetPath('create_your_first_note'),
            height: 286.h,
            width: 350.w,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 12.h),
          const AppText(
            title: 'Create your first note!',
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
