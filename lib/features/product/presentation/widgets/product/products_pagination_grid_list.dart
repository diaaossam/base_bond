import 'package:bond/features/product/presentation/widgets/product/product_item_widget.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../data/models/response/product_model.dart';
import 'empty_product_widget.dart';

class ProductsPaginationGridList extends StatelessWidget {
  final PagingController<int, ProductModel> pagingController;
  final Function(bool, ProductModel) onFavTapped;

  const ProductsPaginationGridList({
    super.key,
    required this.pagingController,
    required this.onFavTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: screenPadding(),
      sliver: PagingListener<int, ProductModel>(
        controller: pagingController,
        builder: (context, state, fetchNextPage) => PagedSliverGrid(
          state: state,
          fetchNextPage: fetchNextPage,
          builderDelegate: PagedChildBuilderDelegate<ProductModel>(
            firstPageProgressIndicatorBuilder: (context) => LoadingWidget(size: LoadingSize.small,),
            itemBuilder: (context, item, index) => ProductItemWidget(
              onFavTapped: (data) {
                onFavTapped(data, item);
              },
              key: ValueKey(item.id.toString()),
              product: item,
              index: index,
              isLiked: item.isAddedToFavourite ?? false,
            ),
            noItemsFoundIndicatorBuilder: (context) => EmptyProductsWidget(),
            newPageProgressIndicatorBuilder: (context) => LoadingWidget(size: LoadingSize.small,),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .98,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.h,

          ),
        ),
      ),
    );
  }
}
