import 'package:auto_route/annotations.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/bloc/helper/base_state.dart';
import '../../../../widgets/section_header.dart';
import '../cubit/wishlist/wishlist_cubit.dart';
import '../widgets/product/products_grid_list.dart';

@RoutePage()
class FavouriteProductsScreen extends StatelessWidget {
  const FavouriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WishlistCubit>()..getWishList(),
      child: BlocBuilder<WishlistCubit, BaseState<List<ProductModel>>>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(title: context.localizations.favorites),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: context.localizations.favorites,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 6.h),),
                ProductsGridList(
                  isLoading: state.isLoading,
                  productList: state.data ?? [],
                  onFavTapped: (data, item) {
                    item.isAddedToFavourite = data;
                    context.read<WishlistCubit>().toggleWishList(
                      productId: item.id ?? 0,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
