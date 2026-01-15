import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/insurance_profile/data/models/insurance_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../config/router/app_router.gr.dart';
import '../../../../core/bloc/helper/base_state.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/loading/loading_widget.dart';
import '../cubit/insurance_profile_cubit.dart';
import '../cubit/insurance_profile_state_data.dart';
import '../widgets/empty_insurance_profile.dart';
import '../widgets/insurance_profile_view.dart';

@RoutePage()
class InsuranceProfileScreen extends StatelessWidget {
  const InsuranceProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<InsuranceProfileCubit>()..initialize(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.insuranceProfile),
        body: BlocBuilder<InsuranceProfileCubit, BaseState>(
          builder: (context, state) {
            final data = state.data ?? const InsuranceProfileStateData();
            final isLoading = state.isLoading;

            if (isLoading) {
              return const Center(child: LoadingWidget());
            }

            if (data.hasProfile) {
              return InsuranceProfileView(
                profile: data.profile!,
                onEdit: () => _navigateToEdit(context: context, model: data.profile!),
              );
            }

            return EmptyInsuranceProfile(
              onCreatePressed: () => _navigateToEdit(context: context),
            );
          },
        ),
      ),
    );
  }

  void _navigateToEdit({
    required BuildContext context,
    InsuranceProfileModel? model,
  }) {
    context.router.push(CreateInsuranceProfileRoute(model: model)).then((result) {
      if (result == true) {
        context.read<InsuranceProfileCubit>().loadInsuranceProfile();
      }
    });
  }
}
