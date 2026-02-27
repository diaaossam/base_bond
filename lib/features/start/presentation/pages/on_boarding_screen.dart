import 'package:auto_route/annotations.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/bloc/helper/base_state.dart';
import '../../data/models/intro_model.dart';
import '../cubit/boarding/on_boarding_cubit.dart';
import '../widgets/on_boarding/boarding_body.dart';

@RoutePage()
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OnBoardingCubit>()..getIntroData(),
      child: Scaffold(
        backgroundColor: context.colorScheme.background,
        appBar: CustomAppBar(
          colors: context.colorScheme.background,
          actions: [
            BlocBuilder<OnBoardingCubit, BaseState<List<IntroModel>>>(
              builder: (context, state) {
                return TextButton(
                  onPressed: () {
                    context.read<OnBoardingCubit>().submit();
                  },
                  child: AppText(
                    text: context.localizations.skip,
                    fontWeight: FontWeight.w600,
                    textSize: 14,
                  ),
                );
              },
            ),
          ],
        ),
        body: Body(),
      ),
    );
  }
}
