import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../widgets/orders/my_orders_body.dart';

@RoutePage()
class OrdersScreen extends StatelessWidget {
  final String type;
  final String title;

  const OrdersScreen({super.key, required this.type, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: MyOrdersBody(type: type),
    );
  }
}
