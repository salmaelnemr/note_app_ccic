import 'package:flutter/material.dart';

import '../../core/app_colors/app_colors.dart';
import '../../core/router_utils/route_utils.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
  });

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.dark,
      cursorColor: AppColors.white,
      onChanged: onChanged,
      style: TextStyle(
        color: AppColors.white,
      ),
      decoration: InputDecoration(
        hintText: 'Search by the keyword...',
        hintStyle: TextStyle(
          color: AppColors.gray,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
            onTap: () => RouteUtils.pop(),
            child: Icon(
              Icons.close,
              color: AppColors.white,
            ),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 24),
        filled: true,
        fillColor: AppColors.darkGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
