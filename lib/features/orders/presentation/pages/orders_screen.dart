import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../widgets/orders/my_orders_body.dart';

@RoutePage()
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localizations.myOrders),
      body: const MyOrdersBody(),
    );
  }
}
