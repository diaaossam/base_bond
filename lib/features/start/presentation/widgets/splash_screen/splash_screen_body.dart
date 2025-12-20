import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/settings/data/models/app_settings.dart';
import 'package:bond/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/deep_link/deep_link.dart';
import '../../../../../gen/assets.gen.dart';
import '../../cubit/start/start_cubit.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, BaseState<AppSettings>>(
      builder: (context, state) {
        return BlocConsumer<StartCubit, BaseState<PageRouteInfo>>(
          listener: (context, state) {
            if (state.isSuccess && state.data != null) {
              init(route: state.data!, context: context);
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 130),
                      child:
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          Assets.images.backgroundSplash.path,
                        ),
                      )
                          .animate()
                          .slideY(begin: -0.5, end: 0.2, duration: 0.1.seconds)
                          .then(delay: 1.milliseconds)
                          .slideY(end: -0.3, duration: 0.1.seconds)
                          .then(delay: 1.milliseconds)
                          .slideY(end: 0.1, duration: 0.1.seconds)
                          .then(delay: 0.1.seconds)
                          .scaleXY(end: 20, duration: 0.5.seconds)
                          .then(delay: 2.seconds),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: SizeConfig.bodyHeight * .25,
                          width: double.infinity,
                          child: Assets.images.logo
                              .image()
                              .animate()
                              .fadeIn(
                              delay: 1.seconds, duration: 900.milliseconds)
                              .slideX(begin: 3, duration: 0.5.seconds),
                        ),
                        const SizedBox(height: 20),
                        AppText(
                          text: AppStrings.appName,
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          textSize: 26,
                        ).animate().fadeIn(
                          delay: 0.5.seconds,
                          duration: 900.milliseconds,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void init({
    required PageRouteInfo route,
    required BuildContext context,
  }) async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      if (initialMessage.data.isNotEmpty) {}
    }
    else {
      await DynamicLinkHandler.instance.initialize(
        callback: (value) {
          Future.delayed(
            const Duration(milliseconds: 2000),
                () =>
                context.router.pushAndPopUntil(
                  route,
                  predicate: (route) => false,
                ),
          );
        },
      );
    }
  }
}
