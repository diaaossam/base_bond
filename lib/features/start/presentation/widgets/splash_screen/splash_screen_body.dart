import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/deep_link/deep_link.dart';
import '../../cubit/start/start_cubit.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartCubit, BaseState<PageRouteInfo>>(
      listener: (context, state) {
        if (state.isSuccess && state.data != null) {
          init(route: state.data!, context: context);
        }
      },
      builder: (context, state) {
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
