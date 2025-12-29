import 'package:flutter/material.dart';

import '../../core/extensions/color_extensions.dart';
import '../../core/utils/app_size.dart';
import 'app_text.dart';
import '../loading/modern_button_loading.dart';

enum CustomButtonType { normal, outline, text }

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.press,
    this.type = CustomButtonType.normal,
    this.textSize,
    this.isActive = true,
    this.iconData,
    this.iconColor,
    this.width,
    this.radius,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.height,
  });

  /// =============== Outline Button ===============
  const CustomButton.outline({
    super.key,
    required this.text,
    required this.press,
    this.textSize,
    this.isActive = true,
    this.iconData,
    this.iconColor,
    this.width,
    this.radius,
    this.isLoading = false,
    this.height,
    this.textColor,
    this.backgroundColor = Colors.transparent,
    this.borderColor,
  }) : type = CustomButtonType.outline;

  /// =============== Text Button ===============
  const CustomButton.text({
    super.key,
    required this.text,
    required this.press,
    this.textSize,
    this.isActive = true,
    this.iconData,
    this.iconColor,
    this.width,
    this.radius,
    this.isLoading = false,
    this.height,
    this.textColor,
  }) : backgroundColor = Colors.transparent,
       borderColor = Colors.transparent,
       type = CustomButtonType.text;

  final String? text;
  final CustomButtonType type;
  final VoidCallback press;
  final double? width;
  final double? height;
  final double? textSize;
  final bool isActive;
  final double? radius;

  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;

  final IconData? iconData;
  final bool isLoading;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: (!widget.isActive) || widget.isLoading,
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height == null
            ? getProportionateScreenHeight(50)
            : getProportionateScreenHeight(widget.height!),
        decoration: BoxDecoration(
          border: _getBorder(context),
          color: _getBackgroundColor(context),
          borderRadius: BorderRadius.circular(widget.radius ?? 16),
        ),
        child: widget.isLoading
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: MorphingLoading(
                    color: _getLoadingColor(context),
                    size: 28,
                  ),
                ),
              )
            : MaterialButton(
                onPressed: widget.press,
                child: AppText(
                  text: widget.text!,
                  color: _getTextColor(context),
                  fontWeight: FontWeight.w600,
                  textSize: widget.textSize ?? 11,
                ),
              ),
      ),
    );
  }

  /// ===================== Styles =====================

  Color _getBackgroundColor(BuildContext context) {
    switch (widget.type) {
      case CustomButtonType.normal:
        return widget.backgroundColor ?? context.colorScheme.primary;

      case CustomButtonType.outline:
        return Colors.transparent;

      case CustomButtonType.text:
        return Colors.transparent;
    }
  }

  Color _getTextColor(BuildContext context) {
    switch (widget.type) {
      case CustomButtonType.normal:
        return widget.textColor ?? Colors.white;

      case CustomButtonType.outline:
        return widget.textColor ?? context.colorScheme.primary;

      case CustomButtonType.text:
        return widget.textColor ?? context.colorScheme.primary;
    }
  }

  BoxBorder? _getBorder(BuildContext context) {
    switch (widget.type) {
      case CustomButtonType.normal:
        return null;

      case CustomButtonType.outline:
        return Border.all(
          color: widget.borderColor ?? context.colorScheme.primary,
          width: 2,
        );

      case CustomButtonType.text:
        return null;
    }
  }

  Color _getLoadingColor(BuildContext context) {
    switch (widget.type) {
      case CustomButtonType.normal:
        return Colors.white;

      case CustomButtonType.outline:
      case CustomButtonType.text:
        return context.colorScheme.primary;
    }
  }
}
