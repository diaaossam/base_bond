import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../cubit/orders_cubit.dart';
import 'my_orders_tab_bar.dart';

class MyOrdersBody extends StatefulWidget {
  const MyOrdersBody({super.key});

  @override
  State<MyOrdersBody> createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, BaseState>(
      builder: (context, state) {
        final bloc = context.read<OrdersCubit>();
        return Column(
          children: [
            TabBarDesign(
              tabController: tabController,
              onTap: (value) {},
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
            Expanded(
              child: TabBarView(controller: tabController, children: []),
            ),
          ],
        );
      },
    );
  }
}
