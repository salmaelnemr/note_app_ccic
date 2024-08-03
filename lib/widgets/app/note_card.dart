import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/app_colors/app_colors.dart';
import '../../core/models/note.dart';
import '../../core/utils.dart';
import '../app_text.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
    this.onDismiss,
    required this.onTap,
  });

  final Note note;
  final void Function()? onDismiss;
  final void Function() onTap;

  EdgeInsets get _cardMargin => EdgeInsets.only(bottom: 24.h);
  BorderRadius get _radius => BorderRadius.circular(12);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) async {
        if (onDismiss != null) {
          onDismiss!();
        }
      },
      background: Container(
        margin: _cardMargin,
        width: double.infinity,
        alignment: Alignment.center,
        child: Icon(FontAwesomeIcons.trash),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: _radius,
        ),
      ),
      child: Padding(
        padding: _cardMargin,
        child: InkWell(
          borderRadius: _radius,
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.width,
              vertical: 16.height,
            ),
            width: double.infinity,
            alignment: Alignment.center,
            child: AppText(
              title: note.title,
              color: AppColors.black,
              fontSize: 24,
            ),
            decoration: BoxDecoration(
              borderRadius: _radius,
              color: Utils
                  .noteColors[Random().nextInt(Utils.noteColors.length - 1)],
            ),
          ),
        ),
      ),
    );
  }
}
