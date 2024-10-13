import 'package:flutter/material.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import '../core/app_colors/app_colors.dart';
import 'app_loading_indicator.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.onPressed,
    this.color = AppColors.darkGray,
    this.isLoading = false,
  });

  final String title;
  final void Function()? onPressed;
  final Color color ;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const AppLoadingIndicator();
    }
    return InkWell(
      onTap: onPressed,
        child: Container(
          height: 44.height,
          width: 44.width,
          alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
          child: AppText(
            title: title ,
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
       ),
    );
  }
}
