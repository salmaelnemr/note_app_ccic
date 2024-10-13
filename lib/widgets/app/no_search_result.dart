import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils.dart';
import '../app_text.dart';

class NoSearchResult extends StatelessWidget {
  const NoSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Utils.getPNGAssetPath('no_search_result'),
            height: 248.h,
            width: 370.w,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 12.h),
          const AppText(
            title: 'Note not found. Try searching again',
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
