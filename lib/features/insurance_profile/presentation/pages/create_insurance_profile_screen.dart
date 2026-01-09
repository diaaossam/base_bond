import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/insurance_profile/data/models/insurance_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../cubit/insurance_profile_cubit.dart';
import '../widgets/insurance_profile_form.dart';

@RoutePage()
class CreateInsuranceProfileScreen extends StatelessWidget {
  final InsuranceProfileModel? model;

  const CreateInsuranceProfileScreen({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = sl<InsuranceProfileCubit>();
        cubit.loadInsuranceCompanies();
        if (model != null) {
          cubit.loadInsuranceProfile(model: model);
        }
        return cubit;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: model == null
              ? context.localizations.createInsuranceProfile
              : context.localizations.editInsuranceProfile,
        ),
        body: InsuranceProfileForm(insuranceProfileModel: model),
      ),
    );
  }
}
