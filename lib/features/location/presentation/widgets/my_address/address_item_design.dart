import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/my_address.dart';

class AddressItemDesign extends StatefulWidget {
  final MyAddress address;
  final bool isSelected;
  final Function(MyAddress)? onEdit;
  final Function(MyAddress)? onDelete;
  final Function(MyAddress)? onSetDefault;
  final int index;

  const AddressItemDesign({
    super.key,
    required this.address,
    required this.isSelected,
    this.onEdit,
    this.onDelete,
    this.onSetDefault,
    this.index = 0,
  });

  @override
  State<AddressItemDesign> createState() => _AddressItemDesignState();
}

class _AddressItemDesignState extends State<AddressItemDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.3, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.1, 0.7, curve: Curves.easeOutCubic),
          ),
        );

    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      if (mounted) _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDefault = widget.address.isDefault == true;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: ScaleTransition(scale: _scaleAnimation, child: child),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          gradient: widget.isSelected
              ? LinearGradient(
                  colors: [
                    context.colorScheme.primary.withValues(alpha: 0.08),
                    context.colorScheme.primary.withValues(alpha: 0.03),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: widget.isSelected ? null : context.colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: widget.isSelected
                ? context.colorScheme.primary
                : context.colorScheme.outline.withValues(alpha: 0.3),
            width: widget.isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.isSelected
                  ? context.colorScheme.primary.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.04),
              blurRadius: widget.isSelected ? 12 : 8,
              offset: const Offset(0, 4),
              spreadRadius: widget.isSelected ? 2 : 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, value, child) {
                    return Transform.scale(scale: value, child: child);
                  },
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          context.colorScheme.primary,
                          context.colorScheme.primary.withValues(alpha: 0.7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: context.colorScheme.primary.withValues(
                            alpha: 0.3,
                          ),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: AppImage.asset(
                      Assets.icons.pinLocation02,
                      color: Colors.white,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppText(
                              text: widget.address.address??'',
                              fontWeight: FontWeight.w600,
                              textSize: 14,
                              maxLines: 1,
                            ),
                          ),
                          8.horizontalSpace,
                          _buildDefaultBadge(context, isDefault),
                        ],
                      ),
                      6.verticalSpace,
                      Row(
                        children: [
                          Icon(
                            Icons.location_city_rounded,
                            size: 14.sp,
                            color: context.colorScheme.primary.withValues(
                              alpha: 0.7,
                            ),
                          ),
                          6.horizontalSpace,
                          Expanded(
                            child: AppText.hint(
                              text: [
                                widget.address.governorate?.title,
                                widget.address.city?.title,
                              ].where((e) => e != null).join(' - '),
                              textSize: 11,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      6.verticalSpace,
                      Row(
                        children: [
                          Icon(
                            Icons.note_outlined,
                            size: 14.sp,
                            color: context.colorScheme.shadow,
                          ),
                          6.horizontalSpace,
                          Expanded(
                            child: AppText.hint(
                              text: widget.address.additionalNotes??'',
                              textSize: 11,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    context.colorScheme.outline.withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            12.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    context: context,
                    icon: Icons.edit_outlined,
                    label: context.localizations.edit,
                    onTap: () =>  widget.onEdit?.call(widget.address),
                    color: context.colorScheme.primary,
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: _buildActionButton(
                    context: context,
                    icon: Icons.delete_outline_rounded,
                    label: context.localizations.delete,
                    onTap: () =>  widget.onDelete?.call(widget.address),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultBadge(BuildContext context, bool isDefault) {
    if (isDefault) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 400),
        curve: Curves.elasticOut,
        builder: (context, value, child) {
          return Transform.scale(scale: value, child: child);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.colorScheme.primary,
                context.colorScheme.primary.withValues(alpha: 0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.primary.withValues(alpha: 0.3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star_rounded, size: 12.sp, color: Colors.white),
              4.horizontalSpace,
              AppText(
                text: context.localizations.defaultAddress,
                textSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      );
    } else {
      return _buildActionButton(
        context: context,
        icon: Icons.star_outline_rounded,
        label: context.localizations.makeDefault,
        onTap:() => widget.onSetDefault?.call(widget.address),
        color: Colors.amber,
      );
    }
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback? onTap,
    required Color color,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.r),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: color.withValues(alpha: 0.2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16.sp, color: color),
              6.horizontalSpace,
              Flexible(
                child: AppText(
                  text: label,
                  textSize: 11,
                  color: color,
                  fontWeight: FontWeight.w500,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
