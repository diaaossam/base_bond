import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_strings.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? textSize;
  final double? textHeight;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextAlign? align;
  final int? maxLines;
  final String? fontFamily;
  final TextType type;

  const AppText({
    super.key,
    required this.text,
    this.color,
    this.textSize,
    this.fontWeight,
    this.maxLines,
    this.textDecoration,
    this.textHeight = 1.2,
    this.fontFamily,
    this.align,
    this.type = TextType.regular,
  });

  /// ===== Hint =====
  const AppText.hint({
    super.key,
    required this.text,
    this.textSize,
    this.fontWeight,
    this.maxLines,
    this.textDecoration,
    this.textHeight = 1.2,
    this.fontFamily,
    this.align,
    this.color,
  }) : type = TextType.hint;

  /// ===== Title =====
  const AppText.title({
    super.key,
    required this.text,
    this.color,
    this.textSize,
    this.fontWeight,
    this.maxLines,
    this.textDecoration,
    this.textHeight = 1.2,
    this.fontFamily,
    this.align,
  }) : type = TextType.title;

  /// ===== Body =====
  const AppText.body({
    super.key,
    required this.text,
    this.color,
    this.textSize,
    this.fontWeight,
    this.maxLines,
    this.textDecoration,
    this.textHeight = 1.4,
    this.fontFamily,
    this.align,
  }) : type = TextType.body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    TextStyle baseStyle;
    switch (type) {
      case TextType.title:
        baseStyle = theme.headlineSmall!;
        break;
      case TextType.regular:
        baseStyle = theme.bodyMedium!;
        break;
      case TextType.hint:
        baseStyle = theme.bodySmall!.copyWith(color: Colors.grey);
        break;

      case TextType.body:
        baseStyle = theme.bodyMedium!;
        break;
    }

    return Text(
      text,
      maxLines: maxLines,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: baseStyle.copyWith(
        fontFamily: fontFamily ?? AppStrings.arabicFont,
        height: textHeight,
        decoration: textDecoration,
        color: fontColor(context: context),
        fontSize: fontSize(),
        fontWeight: fontWeightHandler(),
      ),
    );
  }

  double? fontSize() {
    if (textSize != null) {
      return textSize?.sp;
    }
    switch (type) {
      case TextType.title:
        return 18.sp;
      case TextType.regular:
      case TextType.body:
        return 12.sp;
      case TextType.hint:
        return 11.sp;
    }
  }

  FontWeight? fontWeightHandler() {
    if (fontWeight != null) {
      return fontWeight;
    }
    switch (type) {
      case TextType.title:
        return FontWeight.w600;
      case TextType.regular:
        return FontWeight.w400;
      case TextType.hint:
        return FontWeight.w400;
      case TextType.body:
        return FontWeight.w500;
    }
  }

  Color? fontColor({required BuildContext context}) {
    if (color != null) {
      return color;
    }
    switch (type) {
      case TextType.title:
        return context.colorScheme.onSurface;
      case TextType.regular:
        return context.colorScheme.onSurface;
      case TextType.hint:
        return context.colorScheme.shadow;
      case TextType.body:
        return context.colorScheme.onSurface.withValues(alpha: 0.7);
    }
  }
}

enum TextType { regular, hint, title, body }
