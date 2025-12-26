import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:bond/features/product/presentation/widgets/product_details/product_header_section.dart';
import 'package:bond/features/product/presentation/widgets/product_details/product_image_gallery.dart';
import 'package:bond/features/product/presentation/widgets/product_details/product_info_section.dart';
import 'package:bond/features/product/presentation/widgets/product_details/product_price_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cart_button_design.dart';

class ProductDetailsBody extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailsBody({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: ProductImageGallery(
              images: [
                if (productModel.featureImage != null) productModel.featureImage!,
                ...?productModel.images,
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 16.h),
                ProductHeaderSection(product: productModel),
                SizedBox(height: 20.h),
                ProductPriceSection(product: productModel),
                SizedBox(height: 24.h),
                ProductInfoSection(product: productModel),
                SizedBox(height: 40.h), // Space// r bottom buttons
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar:  CartButtonDesign(productModel: productModel,),
    );
  }
}
