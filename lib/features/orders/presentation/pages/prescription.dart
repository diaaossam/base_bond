import 'package:auto_route/annotations.dart';
import 'package:bond/features/insurance_profile/presentation/cubit/branches/branches_cubit.dart';
import 'package:bond/features/insurance_profile/presentation/cubit/insurance_profile_cubit.dart';
import 'package:bond/features/location/presentation/cubit/my_address/my_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../cubit/prescription/prescription_cubit.dart';
import '../widgets/prescription/prescription_body.dart';

@RoutePage()
class PrescriptionScreen extends StatelessWidget {
  final bool isInsurance;

  const PrescriptionScreen({super.key, required this.isInsurance});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<PrescriptionCubit>()),
        BlocProvider(create: (context) => sl<MyAddressCubit>()),
        BlocProvider(create: (context) => sl<BranchesCubit>()),
        BlocProvider(create: (context) => sl<InsuranceProfileCubit>()..initialize()),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: isInsurance
              ? context.localizations.orderWithYourInsurance
              : context.localizations.prescriptionOrder,
        ),
        body: PrescriptionBody(isInsurance: isInsurance),
      ),
    );
  }
}
