import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../app/presentation/cubit/app_cubit.dart';
import '../../data/models/response/my_address.dart';
import '../cubit/add_new_address/add_new_address_cubit.dart';
import '../widgets/add_address/add_new_address_body.dart';

@RoutePage()
class AddAddressScreen extends StatelessWidget {
  final MyAddress? address;

  const AddAddressScreen({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AddNewAddressCubit>()),
        BlocProvider(create: (context) => sl<AppCubit>()),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: address != null
              ? context.localizations.editAddress
              : context.localizations.addNewAddress,
        ),
        body: AddNewAddressBody(address: address),
      ),
    );
  }
}
