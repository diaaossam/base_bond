import 'package:bond/features/product/presentation/widgets/empty_wishlist_design.dart';
import 'package:bond/features/product/presentation/widgets/product/product_item_widget.dart';
import 'package:bond/features/product/presentation/widgets/product/product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../data/models/response/product_model.dart';

class ProductsGridList extends StatelessWidget {
  final List<ProductModel> productList;
  final Function(bool, ProductModel) onFavTapped;
  final bool isLoading;

  const ProductsGridList({
    super.key,
    required this.productList,
    required this.onFavTapped,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SliverToBoxAdapter(child: ProductShimmer());
    }
    if (productList.isEmpty) {
      return SliverPadding(
        padding: screenPadding(),
        sliver: SliverToBoxAdapter(child: EmptyWishDesign()),
      );
    } else {
      return SliverPadding(
        padding: screenPadding(),
        sliver: SliverGrid.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final item = productList[index];
            return ProductItemWidget(
              onFavTapped: (data) => onFavTapped(data, item),
              key: ValueKey(item.id.toString()),
              product: item,
              index: index,
              isLiked: item.isAddedToFavourite ?? false,
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .98,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.h,
          ),
        ),
      );
    }
  }
}
