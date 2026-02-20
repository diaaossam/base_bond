import 'package:auto_route/auto_route.dart';
import 'package:bond/features/auth/presentation/cubit/otp/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../widgets/otp/otp_body.dart';

@RoutePage()
class OtpScreen extends StatelessWidget {
  final String email;
  final String? phone;

  const OtpScreen({super.key, required this.email, this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OtpCubit>(),
      child: Scaffold(body: OtpBodyWidget(email: email, phone: phone)),
    );
  }
}
