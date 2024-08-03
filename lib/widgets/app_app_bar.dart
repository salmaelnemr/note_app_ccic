import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/dimensions/dimensions.dart';
import '../core/router_utils/route_utils.dart';
import 'app_icon_button.dart';
import 'app_text.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget{
   const AppAppBar({
     super.key,
     this.title,
     this.actions,
     this.enableBackButton = false,
   });

  final String? title;
  final List<Widget>? actions;
  final bool enableBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leading: enableBackButton ? AppIconButton(
          onTap: () => RouteUtils.pop(),
          icon: FontAwesomeIcons.chevronLeft,
          padding: EdgeInsets.only(left: 16),
      ): SizedBox.shrink(),
      leadingWidth: enableBackButton ? 50.width +16 : 0,
      title: AppText(
        title: title ?? "",
        fontWeight: FontWeight.w600,
        fontSize: 43,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
