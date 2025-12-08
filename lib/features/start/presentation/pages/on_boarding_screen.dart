import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../cubit/boarding/on_boarding_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OnBoardingCubit>(),
      child: const Scaffold(body: Center()),
    );
  }
}
