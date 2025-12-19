import 'dart:math';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/bloc/global_cubit/global_cubit.dart';
import '../core/utils/app_strings.dart';

class Rotate extends StatelessWidget {
  final Widget child;

  const Rotate({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, BaseState>(
      builder: (context, state) {
        bool isReverse =
            BlocProvider.of<GlobalCubit>(context).locale.languageCode ==
            AppStrings.arabicCode;
        return Transform.rotate(
          angle: !isReverse ? 180 * pi / 180 : 0,
          child: child,
        );
      },
    );
  }
}
