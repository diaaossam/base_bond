import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/response/product_model.dart';
import 'product_item_widget.dart';

class ProductHorizontalList extends StatefulWidget {
  final List<ProductModel> products;
  final int maxItems;

  const ProductHorizontalList({
    super.key,
    required this.products,
    this.maxItems = 6,
  });

  @override
  State<ProductHorizontalList> createState() => _ProductHorizontalListState();
}

class _ProductHorizontalListState extends State<ProductHorizontalList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<double>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    final displayProducts = widget.products.take(widget.maxItems).toList();
    _fadeAnimations = List.generate(
      displayProducts.length,
      (index) => Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.1,
            0.3 + (index * 0.1),
            curve: Curves.easeOut,
          ),
        ),
      ),
    );

    _slideAnimations = List.generate(
      displayProducts.length,
      (index) => Tween<double>(begin: 30.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.1,
            0.3 + (index * 0.1),
            curve: Curves.easeOutCubic,
          ),
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayProducts = widget.products.take(widget.maxItems).toList();
    return SizedBox(
      height: 220.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: displayProducts.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimations[index].value,
                child: Transform.translate(
                  offset: Offset(0, _slideAnimations[index].value),
                  child: ProductItemWidget(
                    product: displayProducts[index],
                    index: index,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

