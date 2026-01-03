 import 'package:auto_route/auto_route.dart';
import 'package:bond/features/auth/presentation/cubit/social_login/social_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../cubit/login_cubit/login_cubit.dart';
import '../widgets/login/login_body.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LoginCubit>()),
        BlocProvider(create: (context) => sl<SocialLoginBloc>()),
      ],
      child: Scaffold(body: LoginBodyWidget()),
    );
  }
}
