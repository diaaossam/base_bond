import 'package:auto_route/annotations.dart';
import 'package:bond/features/insurance_profile/presentation/cubit/branches/branches_cubit.dart';
import 'package:bond/features/location/presentation/cubit/my_address/my_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../widgets/cart/cart_body.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<MyAddressCubit>()),
        BlocProvider(create: (context) => sl<BranchesCubit>()),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: context.localizations.cart,
          showBackButton: false,
        ),
        body: const CartBody(),
      ),
    );
  }
}
