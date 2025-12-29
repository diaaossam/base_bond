import 'package:auto_route/auto_route.dart';
import 'package:bond/features/product/data/models/request/product_params.dart';
import 'package:bond/features/product/presentation/cubit/product_cubit.dart';
import 'package:bond/features/product/presentation/cubit/wishlist/wishlist_cubit.dart';
import 'package:bond/features/product/presentation/widgets/product/all_product_body.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';

@RoutePage()
class AllProductsScreen extends StatelessWidget {
  final String title;
  final ProductParams initialParams;
  final bool fromHome;

  const AllProductsScreen({
    super.key,
    required this.title,
    required this.initialParams,
    this.fromHome = false,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProductCubit>()),
        BlocProvider(create: (context) => sl<WishlistCubit>()),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: title),
        body: AllProductBody(initialParams: initialParams, fromHome: fromHome),
      ),
    );
  }
}
