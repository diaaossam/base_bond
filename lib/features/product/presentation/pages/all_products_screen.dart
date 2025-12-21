import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/product/data/models/request/product_params.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:bond/features/product/presentation/cubit/product_cubit.dart';
import 'package:bond/features/product/presentation/widgets/product/all_product_body.dart';
import 'package:bond/features/product/presentation/widgets/product/product_item_widget.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';

@RoutePage()
class AllProductsScreen extends StatelessWidget {
  final String title;
  final ProductParams initialParams;

  const AllProductsScreen({
    super.key,
    required this.title,
    required this.initialParams,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: title),
        body: AllProductBody(initialParams: initialParams,),
      ),
    );
  }
}
