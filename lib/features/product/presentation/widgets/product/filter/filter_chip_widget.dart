import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: AppText(text: label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      selectedColor: context.colorScheme.primary.withOpacity(0.2),
      checkmarkColor: context.colorScheme.primary,
      labelStyle: TextStyle(
        color: isSelected
            ? context.colorScheme.primary
            : context.colorScheme.onSurface,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected
            ? context.colorScheme.primary
            : context.colorScheme.outline,
        width: isSelected ? 1.5 : 1,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
    );
  }
}




