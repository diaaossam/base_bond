import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/core/enum/order_type.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:bond/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:bond/features/orders/presentation/widgets/orders/orders_pagination_list.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrderTabView extends StatefulWidget {
  final OrderType orderType;

  const OrderTabView({super.key, required this.orderType});

  @override
  State<OrderTabView> createState() => _OrderTabViewState();
}

class _OrderTabViewState extends State<OrderTabView> with AutomaticKeepAliveClientMixin {
  late PagingController<int, Orders> _pagingController;
  late OrdersCubit _ordersCubit;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _ordersCubit = sl<OrdersCubit>();
    _initPagingController();
  }

  void _initPagingController() {
    _pagingController = PagingController<int, Orders>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: _fetchPage,
    );
  }

  Future<List<Orders>> _fetchPage(int pageKey) async {
    return await _ordersCubit.getOrderList(
      pageKey: pageKey,
      orderType: widget.orderType,
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [OrdersPaginationList(pagingController: _pagingController)],
    );
  }
}






