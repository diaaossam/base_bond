import 'package:auto_route/auto_route.dart';
import 'package:bond/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../cubit/register_cubit/register_cubit.dart';
import '../widgets/register/register_body.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<RegisterCubit>()),
        BlocProvider(create: (context) => sl<AppCubit>()),
      ],
      child: Scaffold(body: RegisterBodyWidget()),
    );
  }
}
