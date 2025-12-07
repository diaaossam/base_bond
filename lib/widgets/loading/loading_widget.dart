import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../core/extensions/color_extensions.dart';
import '../../core/utils/app_size.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;

  const LoadingWidget({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        size: size ?? SizeConfig.bodyHeight * 0.06,
        color: color ?? context.colorScheme.primary,
      ),
    );
  }
}
