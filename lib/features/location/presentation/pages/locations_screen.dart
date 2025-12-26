import 'package:auto_route/annotations.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../cubit/my_address/my_address_cubit.dart';
import '../widgets/my_address/my_address_body.dart';

@RoutePage()
class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MyAddressCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.address),
        body: const MyAddressBody(),
      ),
    );
  }
}
