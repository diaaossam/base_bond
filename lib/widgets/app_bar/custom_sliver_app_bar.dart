import 'dart:ui';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_size.dart';
import '../main_widget/app_text.dart';
import '../main_widget/back_widget.dart';

class CustomSliverAppBar extends StatelessWidget {
  final VoidCallback? pressIcon;
  final String? title;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final bool? isCenterTitle;
  final bool? pinned;
  final PreferredSizeWidget? preferredSizeWidget;
  final Widget? flexibleSpace;
  final Widget? leading;
  final double? expandedHeight;
  final double? leadingWidth;
  final bool showLeading;

  const CustomSliverAppBar({
    super.key,
    this.pressIcon,
    this.title,
    this.actions,
    this.titleWidget,
    this.expandedHeight,
    this.preferredSizeWidget,
    this.flexibleSpace,
    this.isCenterTitle = true,
    this.pinned = true,
    this.leading,
    this.leadingWidth,
    this.showLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned ?? true,
      automaticallyImplyLeading: false,
      backgroundColor: context.colorScheme.surface,
      leadingWidth: leadingWidth ?? SizeConfig.screenWidth * .2,
      centerTitle: isCenterTitle,
      elevation: 1,
      forceElevated: true,
      title:
          titleWidget ??
          AppText(
            text: title != null ? title.toString() : "",
            fontWeight: FontWeight.w600,
            textSize: 13,
          ),
      bottom: preferredSizeWidget,
      leading: showLeading ? leading ?? BackArrowWidget(): null,
      actions: actions,
      flexibleSpace: Container(
        color: context.colorScheme.surface,
        child: flexibleSpace,
      ),
      expandedHeight: expandedHeight,
    );
  }
}
