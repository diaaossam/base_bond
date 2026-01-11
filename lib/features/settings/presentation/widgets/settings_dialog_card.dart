import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/color_extensions.dart';

class SettingsDialogCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const SettingsDialogCard({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric( horizontal: 4.w),
      margin: EdgeInsets.symmetric( vertical: 4.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
       //   SectionHeader(title: title),
          ...children
        ],
      ),
    );
  }
}
