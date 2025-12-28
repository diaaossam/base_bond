import 'package:animate_do/animate_do.dart';
import 'package:bond/core/enum/order_type.dart';
import 'package:flutter/material.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import 'my_orders_tab_bar.dart';
import 'order_tab_view.dart';

class MyOrdersBody extends StatefulWidget {
  const MyOrdersBody({super.key});

  @override
  State<MyOrdersBody> createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<OrderType> _orderTypes = [
    OrderType.pending,
    OrderType.confirmed,
    OrderType.inProgress,
    OrderType.outForDeleivery,
    OrderType.delivered,
    OrderType.returns,
    OrderType.canceled,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _orderTypes.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 400),
          child: TabBarDesign(
            tabController: _tabController,
            tabs: [
              Tab(text: context.localizations.underReview),
              Tab(text: context.localizations.confirmed),
              Tab(text: context.localizations.inProgress),
              Tab(text: context.localizations.outForDeleivery),
              Tab(text: context.localizations.deleiverd),
              Tab(text: context.localizations.returns),
              Tab(text: context.localizations.canceled),
            ],
          ),
        ),
        Expanded(
          child: FadeInUp(
            duration: const Duration(milliseconds: 500),
            child: TabBarView(
              controller: _tabController,
              children: _orderTypes
                  .map((type) => OrderTabView(
                        key: ValueKey(type),
                        orderType: type,
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
