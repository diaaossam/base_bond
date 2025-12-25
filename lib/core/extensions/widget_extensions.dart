import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExtensions on Widget {
  Widget toSliver() => SliverToBoxAdapter(child: this);
  
  Widget toSliverPadding({EdgeInsetsGeometry? padding}) => 
    SliverPadding(
      padding: padding ?? EdgeInsets.zero,
      sliver: SliverToBoxAdapter(child: this),
    );
}

extension NumSpaceExtensions on num {
  Widget get verticalSpaceWidget => SizedBox(height: h);
  Widget get horizontalSpaceWidget => SizedBox(width: w);
}

