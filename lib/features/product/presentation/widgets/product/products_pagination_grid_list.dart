import 'package:bond/features/product/presentation/widgets/product/product_item_widget.dart';
import 'package:bond/features/product/presentation/widgets/product/product_list_item_widget.dart';
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
  final bool isGridView;

  const ProductsPaginationGridList({
    super.key,
    required this.pagingController,
    required this.onFavTapped,
    required this.isGridView,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: screenPadding(),
      sliver: PagingListener<int, ProductModel>(
        key: ValueKey(isGridView),
        controller: pagingController,
        builder: (context, state, fetchNextPage) => isGridView
            ? PagedSliverGrid(
                state: state,
                fetchNextPage: fetchNextPage,
                builderDelegate: PagedChildBuilderDelegate<ProductModel>(
                  firstPageProgressIndicatorBuilder: (context) =>
                      LoadingWidget(size: LoadingSize.small),
                  itemBuilder: (context, item, index) => _AnimatedItemWrapper(
                    key: ValueKey('grid_${item.id}'),
                    child: ProductItemWidget(
                      onFavTapped: (data) {
                        onFavTapped(data, item);
                      },
                      key: ValueKey(item.id.toString()),
                      product: item,
                      index: index,
                      isLiked: item.isAddedToFavourite ?? false,
                    ),
                  ),
                  noItemsFoundIndicatorBuilder: (context) =>
                      EmptyProductsWidget(),
                  newPageProgressIndicatorBuilder: (context) =>
                      LoadingWidget(size: LoadingSize.small),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .98,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.h,
                ),
              )
            : PagedSliverList(
                state: state,
                fetchNextPage: fetchNextPage,
                builderDelegate: PagedChildBuilderDelegate<ProductModel>(
                  firstPageProgressIndicatorBuilder: (context) =>
                      LoadingWidget(size: LoadingSize.small),
                  itemBuilder: (context, item, index) => _AnimatedItemWrapper(
                    key: ValueKey('list_${item.id}'),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: ProductListItemWidget(
                        onFavTapped: (data) {
                          onFavTapped(data, item);
                        },
                        key: ValueKey(item.id.toString()),
                        product: item,
                        index: index,
                        isLiked: item.isAddedToFavourite ?? false,
                      ),
                    ),
                  ),
                  noItemsFoundIndicatorBuilder: (context) =>
                      EmptyProductsWidget(),
                  newPageProgressIndicatorBuilder: (context) =>
                      LoadingWidget(size: LoadingSize.small),
                ),
              ),
      ),
    );
  }
}

class _AnimatedItemWrapper extends StatefulWidget {
  final Widget child;

  const _AnimatedItemWrapper({
    super.key,
    required this.child,
  });

  @override
  State<_AnimatedItemWrapper> createState() => _AnimatedItemWrapperState();
}

class _AnimatedItemWrapperState extends State<_AnimatedItemWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
