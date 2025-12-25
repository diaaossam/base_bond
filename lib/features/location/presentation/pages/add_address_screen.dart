import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../data/models/response/my_address.dart';
import '../cubit/add_new_address/add_new_address_cubit.dart';
import '../widgets/add_new_address_body.dart';

@RoutePage()
class AddAddressScreen extends StatelessWidget {
  final MyAddress? address;

  const AddAddressScreen({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddNewAddressCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.addNewAddress),
        body: AddNewAddressBody(address: address),
      ),
    );
  }
}
