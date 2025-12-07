// 🐦 Flutter imports:

// 🐦 Flutter imports:

import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import '../config/theme/theme_helper.dart';
import '../core/extensions/color_extensions.dart';
import '../gen/assets.gen.dart';
import 'image_picker/app_image.dart';

class AppDropDown<T> extends StatelessWidget {
  final String? label;
  final String? name;
  final bool enabled;
  final T? initialValue;
  final String? hint;
  final double? verticalMargin;
  final String? Function(Object?)? validator;
  final List<DropdownMenuItem<T>>? items;
  final VoidCallback? onRetry;
  final bool isLoading;
  final void Function(T?)? onChanged;
  final Widget? icon, dropDownIcon;

  const AppDropDown({
    super.key,
    this.label,
    required this.items,
    this.onRetry,
    this.dropDownIcon,
    this.enabled = true,
    this.validator,
    this.isLoading = false,
    this.name,
    this.initialValue,
    this.hint,
    this.verticalMargin,
    this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<T>(
      name: name ?? '',
      items: isLoading || items == null ? [] : items!,
      enabled: isLoading ? false : enabled,
      validator: validator,
      style: ThemeHelper().mainTFFTextStyle(context),
      icon: AppImage.asset(Assets.icons.arrowDown),
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
        border: ThemeHelper().buildMainTffBorder(context: context),
        disabledBorder: ThemeHelper().buildMainTffBorder(context: context),
        errorBorder: ThemeHelper().buildErrorBorder(),
        enabledBorder: ThemeHelper().buildMainTffBorder(context: context),
        focusedBorder: ThemeHelper().buildMainTffBorder(context: context),
        prefixIcon: icon,
        filled: true,
        suffixIconConstraints: BoxConstraints(
          maxHeight: 40.h,
          minHeight: 10.h,
          minWidth: 40.w,
        ),
        constraints: BoxConstraints(minHeight: 48.h),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 40.h,
          minHeight: 10.h,
          minWidth: 40.w,
        ),
        fillColor: context.colorScheme.surface,
        labelText: hint,
        labelStyle: ThemeHelper().hintTFFTextStyle(),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: ThemeHelper().hintTFFTextStyle(),
        suffixIcon: isLoading
            ? Container(
                margin: REdgeInsetsDirectional.only(end: 10),
                width: 20.w,
                height: 20.h,
                child: const CircularProgressIndicator(strokeWidth: 2),
              )
            : onRetry != null
            ? IconButton(
                onPressed: onRetry,
                icon: Icon(Icons.repeat, color: context.colorScheme.primary),
              )
            : null,
        contentPadding: REdgeInsetsDirectional.only(
          start: 20,
          top: 10,
          bottom: 10,
          end: 20,
        ),
      ),
    );
  }

  double calculateTextWidth(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width + 100;
  }
}
