import 'package:bond/config/dependencies/injectable_dependencies.dart';
import 'package:bond/core/enum/order_type.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:bond/features/orders/data/models/response/prescription_order_model.dart';
import 'package:bond/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:bond/features/orders/presentation/widgets/orders/orders_pagination_list.dart';
import 'package:bond/features/orders/presentation/widgets/prescription/prescription_pagination_list.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../cubit/prescrirption_cubit.dart';

class OrderTabView extends StatefulWidget {
  final OrderType orderType;
  final String type;

  const OrderTabView({super.key, required this.orderType, required this.type});

  @override
  State<OrderTabView> createState() => _OrderTabViewState();
}

class _OrderTabViewState extends State<OrderTabView>
    with AutomaticKeepAliveClientMixin {
  late PagingController<int, Orders> _pagingController;
  late PagingController<int, PrescriptionOrderModel>
  _pagingPrescriptionController;
  late OrdersCubit _ordersCubit;
  late PrescriptionOrdersCubit _prescriptionCubit;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (widget.type == AppStrings.orders) {
      _ordersCubit = sl<OrdersCubit>();
    } else {
      _prescriptionCubit = sl<PrescriptionOrdersCubit>();
    }
    _initPagingController();
  }

  void _initPagingController() {
    if (widget.type == AppStrings.orders) {
      _pagingController = PagingController<int, Orders>(
        getNextPageKey: (state) {
          if (state.lastPageIsEmpty) return null;
          return state.nextIntPageKey;
        },
        fetchPage: _fetchPage,
      );
    } else {
      _pagingPrescriptionController =
          PagingController<int, PrescriptionOrderModel>(
            getNextPageKey: (state) {
              if (state.lastPageIsEmpty) return null;
              return state.nextIntPageKey;
            },
            fetchPage: _fetchPrescriptionPage,
          );
    }
  }

  Future<List<Orders>> _fetchPage(int pageKey) async {
    return await _ordersCubit.getOrderList(
      pageKey: pageKey,
      orderType: widget.orderType,
    );
  }

  Future<List<PrescriptionOrderModel>> _fetchPrescriptionPage(
    int pageKey,
  ) async {
    return await _prescriptionCubit.getOrderList(
      type: widget.type,
      pageKey: pageKey,
      orderType: widget.orderType,
    );
  }

  @override
  void dispose() {
    if (widget.type == AppStrings.orders) {
      _pagingController.dispose();
    } else {
      _pagingPrescriptionController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: widget.type == AppStrings.orders
          ? [OrdersPaginationList(pagingController: _pagingController)]
          : [
              PrescriptionPaginationList(
                pagingController: _pagingPrescriptionController,
              ),
            ],
    );
  }
}
