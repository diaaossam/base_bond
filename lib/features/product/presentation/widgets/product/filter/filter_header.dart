import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/app_size.dart';

class FilterHeader extends StatelessWidget {
  final VoidCallback onReset;
  final VoidCallback onClose;

  const FilterHeader({
    super.key,
    required this.onReset,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenPadding().horizontal,
        vertical: 16.h,
      ),
      child: Row(
        children: [
          AppText(
            text: context.localizations.filter,
            textSize: 20,
            fontWeight: FontWeight.bold,
          ),
          const Spacer(),
          TextButton(
            onPressed: onReset,
            child: AppText(
              text: context.localizations.reset,
              textSize: 14,
              color: context.colorScheme.primary,
            ),
          ),
          IconButton(
            onPressed: onClose,
            icon: Icon(
              Icons.close,
              color: context.colorScheme.shadow,
            ),
          ),
        ],
      ),
    );
  }
}

