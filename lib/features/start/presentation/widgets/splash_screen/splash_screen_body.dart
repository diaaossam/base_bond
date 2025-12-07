import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../../core/bloc/base_state_ui.dart';
import '../../../../../core/services/deep_link/deep_link.dart';
import '../../cubit/start/start_cubit.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppApiResponse<StartCubit, PageRouteInfo>(
      cubit: sl<StartCubit>(),
      onStateChanged: (state) {
        if (state.isSuccess && state.data != null) {
          init(route: state.data!, context: context);
        }
      },
      onSuccess: (PageRouteInfo data) {
        return const Center(child: Text("Splash"));
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
    } else {
      await DynamicLinkHandler.instance.initialize(
        callback: (value) {
          Future.delayed(
            const Duration(milliseconds: 700),
            () => context.router.pushAndPopUntil(
              route,
              predicate: (route) => false,
            ),
          );
        },
      );
    }
  }
}
