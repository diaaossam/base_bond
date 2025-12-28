import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:bond/features/orders/presentation/widgets/orders/order_item_card.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/empty_widget_design.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrdersPaginationList extends StatelessWidget {
  final PagingController<int, Orders> pagingController;
  final Function(Orders)? onOrderTap;

  const OrdersPaginationList({
    super.key,
    required this.pagingController,
    this.onOrderTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: screenPadding().add(EdgeInsets.only(top: 16.h)),
      sliver: PagingListener<int, Orders>(
        controller: pagingController,
        builder: (context, state, fetchNextPage) => PagedSliverList(
          state: state,
          fetchNextPage: fetchNextPage,
          builderDelegate: PagedChildBuilderDelegate<Orders>(
            firstPageProgressIndicatorBuilder: _buildFirstPageLoading,
            newPageProgressIndicatorBuilder: _buildNewPageLoading,
            noItemsFoundIndicatorBuilder: _buildEmptyState,
            firstPageErrorIndicatorBuilder: _buildErrorState,
            itemBuilder: (context, order, index) => OrderItemCard(
              order: order,
              index: index,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFirstPageLoading(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.bodyHeight * 0.2),
      child: const LoadingWidget(size: LoadingSize.small),
    );
  }

  Widget _buildNewPageLoading(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: const LoadingWidget(size: LoadingSize.small),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return EmptyWidgetDesign(
      msg: context.localizations.noOrdersFound,
      image: Assets.images.orders.path,
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: SizeConfig.bodyHeight * 0.15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 60.sp,
              color: Colors.red.withValues(alpha: 0.6),
            ),
            16.verticalSpace,
            Text(
              context.localizations.somethingWentWrong,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
