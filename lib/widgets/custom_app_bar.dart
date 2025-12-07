import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_size.dart';
import 'app_text.dart';
import 'back_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? pressIcon;
  final String? title;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final Widget? leadingWidget;
  final PreferredSizeWidget? preferredSizeWidget;
  final double? leadingWidth;
  final bool? isCenterTitle;
  final bool showBackButton;
  final double? elevation;
  final double? height;

  const CustomAppBar(
      {super.key,
      this.pressIcon,
      this.title,
      this.leadingWidth,
      this.elevation,
      this.preferredSizeWidget,
      this.leadingWidget,
      this.actions,
      this.height,
      this.showBackButton = true,
      this.titleWidget,
      this.isCenterTitle = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: leadingWidth ?? SizeConfig.screenWidth * .13,
      elevation: 0,
      centerTitle: isCenterTitle,
      title: titleWidget ??
          AppText(
            text: title != null ? title.toString() : "",
            fontWeight: FontWeight.w600,
            textSize: 14,
          ),
      leading: leadingWidget ??
          Visibility(
            visible: showBackButton,
            child: BackArrowWidget(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsetsDirectional.only(start: 10),
              callback: pressIcon ?? () => context.router.maybePop(),
            ),
          ),
      actions: actions,
      bottom: preferredSizeWidget,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (height??0));
}
