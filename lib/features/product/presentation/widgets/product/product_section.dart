import 'package:bond/features/product/presentation/cubit/wishlist/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart' as auto_route;

import '../../../../../core/bloc/helper/base_state.dart';
import '../../../../../config/router/app_router.gr.dart';
import '../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../../widgets/section_header.dart';
import '../../../data/models/request/product_params.dart';
import '../../../data/models/response/product_model.dart';
import '../../cubit/product_cubit.dart';
import 'product_horizontal_list.dart';
import 'product_shimmer.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final String actionText;
  final ProductParams initialParams;
  final int maxItems;

  const ProductSection({
    super.key,
    required this.title,
    required this.actionText,
    required this.initialParams,
    this.maxItems = 6,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductCubit>()..getProducts(initialParams),
        ),
        BlocProvider(create: (context) => sl<WishlistCubit>()),
      ],
      child: BlocBuilder<ProductCubit, BaseState<List<ProductModel>>>(
        builder: (context, state) {
          if (state.isLoading) {
            return SliverToBoxAdapter(child: ProductShimmer());
          }
          final products = state.data ?? [];
          if (products.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  title: title,
                  actionText: actionText,
                  onActionTap: () {
                    context.router.push(
                      AllProductsRoute(
                        title: title,
                        initialParams: initialParams,
                      ),
                    );
                  },
                ),
                SizedBox(height: 6.h),
                ProductHorizontalList(products: products, maxItems: maxItems),
              ],
            ),
          );
        },
      ),
    );
  }
}
