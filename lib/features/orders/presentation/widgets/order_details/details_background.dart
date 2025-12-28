import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/color_extensions.dart';

class OrderDetailsBackground extends StatelessWidget {
  const OrderDetailsBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.colorScheme.primary,
            context.colorScheme.primary.withOpacity(0.8),
            context.colorScheme.secondary,
          ],
        ),
      ),
    );
  }
}
