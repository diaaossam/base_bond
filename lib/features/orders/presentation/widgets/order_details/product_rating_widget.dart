import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/features/orders/presentation/cubit/order_details_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductRatingWidget extends StatefulWidget {
  final int productId;
  final int orderId;
  final String productName;

  const ProductRatingWidget({
    super.key,
    required this.productId,
    required this.orderId,
    required this.productName,
  });

  @override
  State<ProductRatingWidget> createState() => _ProductRatingWidgetState();
}

class _ProductRatingWidgetState extends State<ProductRatingWidget> {
  int _selectedRating = 0;
  bool _isExpanded = false;
  bool _isRated = false;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderDetailsCubit>();
    
    // Check if already rated
    if (cubit.isProductRated(widget.productId) || _isRated) {
      return _buildRatedBadge(context);
    }

    return BlocListener<OrderDetailsCubit, BaseState<String>>(
      listenWhen: (previous, current) =>
          current.identifier == 'rate_product_${widget.productId}',
      listener: (context, state) {
        if (state.isSuccess) {
          setState(() => _isRated = true);
          AppConstant.showCustomSnakeBar(
            context,
            context.localizations.thankYouForRating,
            true,
          );
        } else if (state.isFailure) {
          AppConstant.showCustomSnakeBar(
            context,
            state.error.toString() ?? context.localizations.ratingError,
            false,
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rate button
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: context.colorScheme.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _isExpanded ? Icons.close : Icons.star_border_rounded,
                    color: context.colorScheme.primary,
                    size: 16.sp,
                  ),
                  4.horizontalSpace,
                  AppText(
                    text: _isExpanded
                        ? context.localizations.hideRating
                        : context.localizations.rateProduct,
                    textSize: 10,
                    fontWeight: FontWeight.w600,
                    color: context.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          // Rating section (expandable)
          if (_isExpanded) ...[
            12.verticalSpace,
            _buildRatingStars(context),
            if (_selectedRating > 0) ...[
              12.verticalSpace,
              _buildCommentField(context),
              12.verticalSpace,
              _buildSubmitButton(context),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildRatedBadge(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: context.colorScheme.tertiary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            color: context.colorScheme.tertiary,
            size: 16.sp,
          ),
          4.horizontalSpace,
          AppText(
            text: context.localizations.rated,
            textSize: 10,
            fontWeight: FontWeight.w600,
            color: context.colorScheme.tertiary,
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: context.localizations.rateProduct,
            textSize: 12,
            fontWeight: FontWeight.w600,
          ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              return GestureDetector(
                onTap: () => setState(() => _selectedRating = starIndex),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.all(4.w),
                  child: Icon(
                    starIndex <= _selectedRating
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    color: starIndex <= _selectedRating
                        ? Colors.amber
                        : context.colorScheme.outline,
                    size: 32.sp,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentField(BuildContext context) {
    return TextField(
      controller: _commentController,
      maxLines: 2,
      decoration: InputDecoration(
        hintText: context.localizations.addComment,
        hintStyle: TextStyle(
          fontSize: 12.sp,
          color: context.colorScheme.outline,
        ),
        filled: true,
        fillColor: context.colorScheme.surfaceContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.all(12.w),
      ),
      style: TextStyle(fontSize: 12.sp),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, BaseState<String>>(
      buildWhen: (previous, current) =>
          current.identifier == 'rate_product_${widget.productId}',
      builder: (context, state) {
        final isLoading = state.isLoading &&
            state.identifier == 'rate_product_${widget.productId}';

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    if (_selectedRating == 0) {
                      AppConstant.showCustomSnakeBar(
                        context,
                        context.localizations.pleaseSelectRating,
                        false,
                      );
                      return;
                    }
                    context.read<OrderDetailsCubit>().rateProduct(
                          productId: widget.productId,
                          orderId: widget.orderId,
                          rating: _selectedRating,
                          comment: _commentController.text.isNotEmpty
                              ? _commentController.text
                              : null,
                        );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: isLoading
                ? SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : AppText(
                    text: context.localizations.submitRating,
                    textSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
          ),
        );
      },
    );
  }
}
