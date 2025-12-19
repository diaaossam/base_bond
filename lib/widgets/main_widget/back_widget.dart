import 'package:auto_route/auto_route.dart' show AutoRouterX;
import 'package:flutter/material.dart';

import '../../core/extensions/color_extensions.dart';
import '../../core/utils/app_size.dart';
import '../../gen/assets.gen.dart';
import '../image_picker/app_image.dart';
import '../rotate.dart';

class BackArrowWidget extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;

  const BackArrowWidget({super.key, this.padding, this.margin, this.color});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.router.canPop(),
      child: InkWell(
        onTap: () => context.router.canPop() ? context.router.pop() : null,
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            shape: BoxShape.circle,
            border: Border.all(color: context.colorScheme.outline),
          ),
          padding: padding ?? const EdgeInsets.all(12),
          margin:
              margin ??
              EdgeInsetsDirectional.symmetric(
                horizontal: SizeConfig.bodyHeight * .02,
                vertical: 5,
              ),
          child: Rotate(
            child: AppImage.asset(
              Assets.icons.arrowBack,
              color: color ?? context.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
