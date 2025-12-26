import 'package:bond/features/product/presentation/widgets/product/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../data/models/response/product_model.dart';

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
            itemBuilder: (context, item, index) => ProductItemWidget(
              onFavTapped: (data) {
                onFavTapped(data, item);
              },
              key: ValueKey(item.id.toString()),
              product: item,
              index: index,
              isLiked: item.isAddedToFavourite ?? false,
            ),
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
