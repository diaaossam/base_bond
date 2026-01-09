import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/app/data/models/branches_model.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/enum/deleivery_method.dart';
import '../../../../../location/data/models/response/my_address.dart';
import 'deleivery_option.dart';
import 'home_deleivery_design.dart';
import '../parmacy_pickup/pharmacy_pickup_design.dart';

class CartLocationDesign extends StatefulWidget {
  final MyAddress? defaultAddress;
  final Function(MyAddress)? onAddressChanged;
  final Function(DeliveryMethod)? onDeleiveryMethod;
  final BranchesModel? selectedBranch;
  final Function(BranchesModel) onBranchChanged;

  const CartLocationDesign({
    super.key,
    this.defaultAddress,
    this.onAddressChanged,
    this.selectedBranch,
    required this.onBranchChanged,
    this.onDeleiveryMethod,
  });

  @override
  State<CartLocationDesign> createState() => _CartLocationDesignState();
}

class _CartLocationDesignState extends State<CartLocationDesign> {
  DeliveryMethod _selectedMethod = DeliveryMethod.home_delivery;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            _buildDeliveryMethodSelection(context),
            SizedBox(height: 12.h),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 0.1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: _selectedMethod == DeliveryMethod.home_delivery
                  ? HomeDeleiveryDesign(
                      defaultAddress: widget.defaultAddress,
                      onAddressChanged: widget.onAddressChanged,
                    )
                  : Container(
                      key: const ValueKey('pharmacy_pickup'),
                      child: PharmacyPickupDesign(
                        selectedBranch: widget.selectedBranch,
                        onBranchSelected: widget.onBranchChanged,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryMethodSelection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.colorScheme.primary.withValues(alpha: 0.05),
            context.colorScheme.primary.withValues(alpha: 0.02),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.colorScheme.primary.withValues(alpha: 0.15),
                      context.colorScheme.primary.withValues(alpha: 0.08),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.local_shipping_rounded,
                  color: context.colorScheme.primary,
                  size: 18,
                ),
              ),
              12.horizontalSpace,
              AppText(
                text: context.localizations.deleiveryType,
                fontWeight: FontWeight.w600,
                textSize: 11,
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            children: [
              Expanded(
                child: DeliveryOption(
                  icon: Icons.home_rounded,
                  label: context.localizations.homeDelivery,
                  isSelected: _selectedMethod == DeliveryMethod.home_delivery,
                  onTap: () {
                    widget.onDeleiveryMethod?.call(
                      DeliveryMethod.home_delivery,
                    );
                    setState(
                      () => _selectedMethod = DeliveryMethod.home_delivery,
                    );
                  },
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: DeliveryOption(
                  icon: Icons.store_rounded,
                  label: context.localizations.pharmacyPickup,
                  isSelected: _selectedMethod == DeliveryMethod.pharmacy_pickup,
                  onTap: () {
                    widget.onDeleiveryMethod?.call(
                      DeliveryMethod.pharmacy_pickup,
                    );
                    setState(
                      () => _selectedMethod = DeliveryMethod.pharmacy_pickup,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
