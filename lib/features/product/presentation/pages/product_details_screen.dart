import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_cubit.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:bond/features/product/presentation/cubit/details/product_details_cubit.dart';
import 'package:bond/features/product/presentation/widgets/product_details/product_details_body.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/image_picker/app_image.dart';
import '../../../orders/presentation/cubit/cart/cart_state_data.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<ProductDetailsCubit>()
        ..getProductDetails(id: product.id ?? 0, productModel: product),
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: CustomAppBar(
          title: context.localizations.productDetails,
          showBackButton: true,
          actions: [
            BlocBuilder<CartCubit, BaseState<CartStateData>>(
              builder: (context, state) {
                return ElasticIn(
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Badge(
                      backgroundColor: Colors.red,
                      isLabelVisible:state.data!.cartList.length.toString()!="0" ,
                      label: AppText(text: state.data!.cartList.length.toString(), color: Colors.white,),
                      child: AppImage.asset(
                        Assets.icons.shoppingCart,
                        color: context.colorScheme.shadow,
                      ),
                    ),
                  ),
                );
              },
            ),
            15.horizontalSpaceDiagonal
          ],
        ),
        body: ProductDetailsBody(productModel: product),
      ),
    );
  }
}
