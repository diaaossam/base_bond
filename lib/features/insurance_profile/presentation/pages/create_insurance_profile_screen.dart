import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../cubit/insurance_profile_cubit.dart';
import '../widgets/insurance_profile_form.dart';

@RoutePage()
class CreateInsuranceProfileScreen extends StatelessWidget {
  const CreateInsuranceProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<InsuranceProfileCubit>()..loadInsuranceCompanies(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: context.localizations.createInsuranceProfile,
        ),
        body: InsuranceProfileForm(isEditing: false, onSuccess: () {}),
      ),
    );
  }
}

