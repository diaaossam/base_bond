import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/product/data/models/request/product_params.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/active_substances_filter_section.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/brand_filter_section.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/category_filter_section.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/filter_header.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/price_range_filter_section.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/special_filters_section.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductFilterBottomSheet extends StatefulWidget {
  final ProductParams initialParams;
  final Function(ProductParams) onApplyFilter;

  const ProductFilterBottomSheet({
    super.key,
    required this.initialParams,
    required this.onApplyFilter,
  });

  static Future<void> show(
    BuildContext context, {
    required ProductParams initialParams,
    required Function(ProductParams) onApplyFilter,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ProductFilterBottomSheet(
        initialParams: initialParams,
        onApplyFilter: onApplyFilter,
      ),
    );
  }

  @override
  State<ProductFilterBottomSheet> createState() =>
      _ProductFilterBottomSheetState();
}

class _ProductFilterBottomSheetState extends State<ProductFilterBottomSheet> {
  late ProductParams _filterParams;
  final TextEditingController _priceFromController = TextEditingController();
  final TextEditingController _priceToController = TextEditingController();
  String? _selectedSortBy;

  @override
  void initState() {
    super.initState();
    _filterParams = widget.initialParams;
    _priceFromController.text = _filterParams.priceFrom?.toString() ?? '';
    _priceToController.text = _filterParams.priceTo?.toString() ?? '';
    _selectedSortBy = _filterParams.sortBy;
  }

  @override
  void dispose() {
    _priceFromController.dispose();
    _priceToController.dispose();
    super.dispose();
  }

  void _applyFilter() {
    final priceFrom = _priceFromController.text.isNotEmpty
        ? int.tryParse(_priceFromController.text)
        : null;
    final priceTo = _priceToController.text.isNotEmpty
        ? int.tryParse(_priceToController.text)
        : null;

    final updatedParams = _filterParams.copyWith(
      priceFrom: priceFrom,
      priceTo: priceTo,
      sortBy: _selectedSortBy,
      page: 1,
    );

    widget.onApplyFilter(updatedParams);
    Navigator.pop(context);
  }

  void _resetFilter() {
    setState(() {
      _filterParams = const ProductParams();
      _priceFromController.clear();
      _priceToController.clear();
      _selectedSortBy = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height ,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 12.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: context.colorScheme.shadow.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          FilterHeader(
            onReset: _resetFilter,
            onClose: () => Navigator.pop(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: screenPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryFilterSection(
                    selectedCategoryId: _filterParams.categoryId,
                    onCategorySelected: (categoryId) {
                      setState(() {
                        _filterParams = _filterParams.copyWith(
                          categoryId: categoryId,
                        );
                      });
                    },
                  ),
                  24.verticalSpace,
                  BrandFilterSection(
                    selectedBrandId: _filterParams.brandId,
                    onBrandSelected: (brandId) {
                      setState(() {
                        _filterParams = _filterParams.copyWith(
                          brandId: brandId,
                        );
                      });
                    },
                  ),
                  24.verticalSpace,
                  ActiveSubstancesFilterSection(
                    selectedActiveSubstanceId: _filterParams.activeSubstanceId,
                    onActiveSubstanceSelected: (activeSubstanceId) {
                      setState(() {
                        _filterParams = _filterParams.copyWith(
                          activeSubstanceId: activeSubstanceId,
                        );
                      });
                    },
                  ),
                  24.verticalSpace,
                  PriceRangeFilterSection(
                    priceFromController: _priceFromController,
                    priceToController: _priceToController,
                  ),
                  24.verticalSpace,
                  SpecialFiltersSection(
                    isFeatured: _filterParams.isFeatured == true,
                    isNewArrival: _filterParams.isNewArrival == true,
                    isBestSeller: _filterParams.isBestSeller == true,
                    onFeaturedChanged: (value) {
                      setState(() {
                        _filterParams = _filterParams.copyWith(
                          isFeatured: value ? true : null,
                        );
                      });
                    },
                    onNewArrivalChanged: (value) {
                      setState(() {
                        _filterParams = _filterParams.copyWith(
                          isNewArrival: value ? true : null,
                        );
                      });
                    },
                    onBestSellerChanged: (value) {
                      setState(() {
                        _filterParams = _filterParams.copyWith(
                          isBestSeller: value ? true : null,
                        );
                      });
                    },
                  ),
                  32.verticalSpace,
                ],
              ),
            ),
          ),
          Padding(
            padding: screenPadding(),
            child: CustomButton(press: _applyFilter,text: context.localizations.applyFilter,),
          ),
          SizedBox(height: SizeConfig.bodyHeight*.02,),
        ],
      ),
    );
  }
}
