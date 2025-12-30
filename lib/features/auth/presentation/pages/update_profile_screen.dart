import 'package:auto_route/annotations.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:bond/features/auth/presentation/cubit/update_profile/update_profile_cubit.dart';
import 'package:bond/features/auth/presentation/widgets/update_profile/update_profile_form.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';

@RoutePage()
class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UpdateProfileCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.updateProfile),
        body: const UpdateProfileForm(),
      ),
    );
  }
}
