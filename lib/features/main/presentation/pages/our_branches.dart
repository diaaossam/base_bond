import 'package:auto_route/annotations.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../insurance_profile/presentation/cubit/branches/branches_cubit.dart';
import '../../../insurance_profile/presentation/cubit/branches/branches_data_state.dart';
import '../../../orders/order_helper.dart';
import '../../../orders/presentation/widgets/cart/parmacy_pickup/branch_selection_dialog.dart';

@RoutePage()
class OurBranchesScreen extends StatelessWidget {
  const OurBranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BranchesCubit>()..loadAllBranches(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.ourBranches),
        body: BlocBuilder<BranchesCubit, BaseState<BranchesDataState>>(
          builder: (context, state) {
            return BranchSelectionSheet(
              branches: state.data?.branches ?? [],
              onBranchSelected: (displayBranch) {
                OrderHelper().openLocationInMaps(
                  lat: displayBranch.latitude ?? 0,
                  lon: displayBranch.longitude ?? 0,
                );
              },
              isSheet: false,
            );
          },
        ),
      ),
    );
  }
}
