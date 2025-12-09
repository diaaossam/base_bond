import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/color_extensions.dart';

class ProgressCirculureWidget extends StatelessWidget {
  final int count;
  final PageController pageController;

  const ProgressCirculureWidget({
    super.key,
    required this.count,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (pageController.page ?? 0) / (count - 1);
    return SizedBox(
      width: 60,
      height: 60,
      child: CircularProgressIndicator(
        value: progress.clamp(0.0, 1.0),
        strokeWidth: 4,
        valueColor: AlwaysStoppedAnimation<Color>(context.colorScheme.primary),
        backgroundColor: context.colorScheme.primary.withValues(alpha: 0.2),
      ),
    );
  }
}
