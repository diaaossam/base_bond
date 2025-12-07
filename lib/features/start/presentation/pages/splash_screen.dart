import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/utils/app_size.dart';
import '../cubit/start/start_cubit.dart';
import '../widgets/splash_screen/splash_screen_body.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => sl<StartCubit>(),
      child: Scaffold(body: const SplashBody()),
    );
  }
}
