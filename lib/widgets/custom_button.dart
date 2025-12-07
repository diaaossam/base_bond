import 'package:flutter/material.dart';

import '../core/extensions/color_extensions.dart';
import '../core/utils/app_size.dart';
import 'app_text.dart';
import 'loading/loading_widget.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.textSize,
    required this.press,
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
    this.isBorder = false,
  });

  const CustomButton.border({
    super.key,
    required this.text,
    this.textSize,
    required this.press,
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
    this.isBorder = true,
  });

  final String? text;
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
  final bool isBorder;

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
          border: widget.isBorder
              ? Border.all(
                  color: _setUpBorderColor(context),
                  width: getProportionateScreenHeight(2),
                )
              : null,
          color: _setUpColor(context),
          borderRadius: BorderRadius.circular(
            widget.radius == null ? 16 : widget.radius!,
          ),
        ),
        child: widget.isLoading == true
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: LoadingWidget(color: Colors.white),
                ),
              )
            : MaterialButton(
                onPressed: widget.press,
                child: AppText(
                  color: widget.textColor ?? Colors.black,
                  text: widget.text!,
                  fontWeight: FontWeight.w600,
                  textSize: widget.textSize == null ? 13 : widget.textSize!,
                ),
              ),
      ),
    );
  }

  Color _setUpColor(BuildContext context) {
    if (widget.isActive) {
      return widget.backgroundColor ?? context.colorScheme.primary;
    } else {
      return context.colorScheme.onPrimary;
    }
  }

  Color _setUpBorderColor(BuildContext context) {
    if (widget.isActive) {
      return widget.borderColor == null
          ? context.colorScheme.primary
          : widget.borderColor!;
    } else {
      return context.colorScheme.onPrimary;
    }
  }
}
