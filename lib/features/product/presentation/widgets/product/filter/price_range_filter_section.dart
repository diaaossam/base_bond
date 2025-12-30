import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/filter_section_title.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceRangeFilterSection extends StatefulWidget {
  final TextEditingController priceFromController;
  final TextEditingController priceToController;

  const PriceRangeFilterSection({
    super.key,
    required this.priceFromController,
    required this.priceToController,
  });

  @override
  State<PriceRangeFilterSection> createState() => _PriceRangeFilterSectionState();
}

class _PriceRangeFilterSectionState extends State<PriceRangeFilterSection> {
  static const double _minPrice = 0;
  static const double _maxPrice = 1000000;
  
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _initializeRangeValues();
    
    // Listen to text field changes to update slider
    widget.priceFromController.addListener(_onTextFieldChanged);
    widget.priceToController.addListener(_onTextFieldChanged);
  }

  void _initializeRangeValues() {
    final fromValue = double.tryParse(widget.priceFromController.text) ?? _minPrice;
    final toValue = double.tryParse(widget.priceToController.text) ?? _maxPrice;
    
    _currentRangeValues = RangeValues(
      fromValue.clamp(_minPrice, _maxPrice),
      toValue.clamp(_minPrice, _maxPrice),
    );
  }

  void _onTextFieldChanged() {
    if (!mounted) return;
    
    final fromValue = double.tryParse(widget.priceFromController.text);
    final toValue = double.tryParse(widget.priceToController.text);
    
    if (fromValue != null && toValue != null) {
      setState(() {
        _currentRangeValues = RangeValues(
          fromValue.clamp(_minPrice, _maxPrice),
          toValue.clamp(_minPrice, _maxPrice),
        );
      });
    }
  }

  void _onRangeChanged(RangeValues values) {
    setState(() {
      _currentRangeValues = values;
      widget.priceFromController.text = values.start.round().toString();
      widget.priceToController.text = values.end.round().toString();
    });
  }

  @override
  void dispose() {
    widget.priceFromController.removeListener(_onTextFieldChanged);
    widget.priceToController.removeListener(_onTextFieldChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colorScheme.primary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterSectionTitle(title: context.localizations.priceRange),
          
          12.verticalSpace,
          
          // Price Range Display
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPriceTag(
                context,
                label: context.localizations.minPrice,
                price: _currentRangeValues.start.round(),
              ),
              Container(
                height: 2.h,
                width: 24.w,
                color: context.colorScheme.primary.withValues(alpha: 0.5),
              ),
              _buildPriceTag(
                context,
                label: context.localizations.maxPrice,
                price: _currentRangeValues.end.round(),
              ),
            ],
          ),
          
          12.verticalSpace,
          
          // Range Slider
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4.h,
              activeTrackColor: context.colorScheme.primary,
              inactiveTrackColor: context.colorScheme.primary.withValues(alpha: 0.2),
              thumbColor: context.colorScheme.primary,
              overlayColor: context.colorScheme.primary.withValues(alpha: 0.2),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.r),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20.r),
              rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 10.r),
              rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
              valueIndicatorColor: context.colorScheme.primary,
              valueIndicatorTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: RangeSlider(
              values: _currentRangeValues,
              min: _minPrice,
              max: _maxPrice,
              divisions: 100,
              labels: RangeLabels(
                '${_currentRangeValues.start.round()}',
                '${_currentRangeValues.end.round()}',
              ),
              onChanged: _onRangeChanged,
            ),
          ),
          
          16.verticalSpace,
          
          // Text Fields
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: widget.priceFromController,
                  keyboardType: TextInputType.number,
                  hintText: context.localizations.from,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: CustomTextFormField(
                  controller: widget.priceToController,
                  keyboardType: TextInputType.number,
                  hintText: context.localizations.to,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceTag(BuildContext context, {required String label, required int price}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: label,
            textSize: 11,
            color: context.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
          2.verticalSpace,
          AppText(
            text: '$price ${context.localizations.egp}',
            textSize: 12,
            fontWeight: FontWeight.bold,
            color: context.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

