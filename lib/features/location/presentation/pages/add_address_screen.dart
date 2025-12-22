import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';

@RoutePage()
class AddAddressScreen extends StatelessWidget {
  final MyAddress? address;

  const AddAddressScreen({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<GlobalLocationCubit>()),
        BlocProvider(create: (context) => sl<AddNewAddressCubit>()),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.addNewAddress),
        body: AddNewAddressBody(address: address),
      ),
    );
  }
}
