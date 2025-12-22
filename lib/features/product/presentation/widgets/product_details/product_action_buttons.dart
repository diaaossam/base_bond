import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:bond/features/product/presentation/widgets/product/like_button.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductActionButtons extends StatefulWidget {
  final ProductModel product;

  const ProductActionButtons({
    super.key,
    required this.product,
  });

  @override
  State<ProductActionButtons> createState() => _ProductActionButtonsState();
}

class _ProductActionButtonsState extends State<ProductActionButtons>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.product.isAddedToFavourite ?? false;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onAddToCart() {
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
    // TODO: Implement add to cart logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText(
          text: 'تمت إضافة المنتج إلى السلة',
          color: Colors.white,
        ),
        backgroundColor: context.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  void _onLikeTapped(bool isLiked) {
    setState(() {
      _isLiked = isLiked;
    });
    // TODO: Implement like/unlike logic
  }

  @override
  Widget build(BuildContext context) {
    final isOutOfStock = widget.product.currentStock == null ||
        (int.tryParse(widget.product.currentStock ?? '0') ?? 0) == 0;

    return Row(
      children: [
        // Like Button
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: context.colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: LikeButtonDesign(
            onTapped: _onLikeTapped,
            isLiked: _isLiked,
            size: 24,
            padding: 0,
          ),
        ),
        SizedBox(width: 12.w),

        // Add to Cart Button
        Expanded(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: CustomButton(
              text: isOutOfStock ? 'غير متوفر' : 'أضف إلى السلة',
              press: isOutOfStock ? () {} : _onAddToCart,
              isActive: !isOutOfStock,
              height: 50,
              radius: 12,
            ),
          ),
        ),
      ],
    );
  }
}

