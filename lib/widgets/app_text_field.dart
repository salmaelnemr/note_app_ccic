import 'package:flutter/material.dart';
import '../core/app_colors/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
     super.key,
     required this.hint ,
     this.cursorHeight = 28,
     this.hintFontSize = 24,
     this.onChanged,
     this.validator,
     this.maxLength,
     this.controller,
     this.onSaved,
  });

  final String hint;
  final double cursorHeight;
  final double hintFontSize;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.white,
      cursorHeight: cursorHeight,
      keyboardAppearance: Brightness.dark,
      style: TextStyle(
        color: AppColors.white,
        fontSize: hintFontSize,
      ),
      maxLines: null,
      textInputAction: TextInputAction.newline,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      maxLength: maxLength,
      decoration: InputDecoration(
        counterStyle: TextStyle(
          color: AppColors.white,
        ),
        contentPadding: EdgeInsets.zero,
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.gray,
          fontSize: hintFontSize,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
