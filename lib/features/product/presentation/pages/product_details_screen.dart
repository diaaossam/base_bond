import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:bond/features/product/presentation/cubit/details/product_details_cubit.dart';
import 'package:bond/features/product/presentation/widgets/product_details/product_details_body.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductDetailsCubit>(),
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: CustomAppBar(
          title: context.localizations.productDetails,
          showBackButton: true,
        ),
        body: ProductDetailsBody(productModel: product),
      ),
    );
  }
}

