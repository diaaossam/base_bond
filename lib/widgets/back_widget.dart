import 'package:bond/widgets/rotate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/extensions/color_extensions.dart';
import '../core/utils/app_size.dart';
import '../gen/assets.gen.dart';

class BackArrowWidget extends StatelessWidget {
  final VoidCallback callback;
  final EdgeInsets? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;

  const BackArrowWidget({
    super.key,
    required this.callback,
    this.padding,
    this.margin,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          shape: BoxShape.circle,
          border: Border.all(color: context.colorScheme.outline),
        ),
        padding: padding ?? const EdgeInsets.all(8),
        margin:
            margin ??
            EdgeInsetsDirectional.symmetric(
              horizontal: SizeConfig.bodyHeight * .02,
              vertical: 5,
            ),
        child: Rotate(
          child: SvgPicture.asset(
            Assets.icons.arrowBack,
            color: color ?? context.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
