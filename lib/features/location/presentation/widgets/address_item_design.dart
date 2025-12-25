import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/image_picker/app_image.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../data/models/response/my_address.dart';

class AddressItemDesign extends StatelessWidget {
  final MyAddress address;
  final bool isSelected;
  final bool showActions;
  final VoidCallback callback;

  const AddressItemDesign({
    super.key,
    required this.address,
    required this.isSelected,
    required this.showActions,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * .03,
        vertical: SizeConfig.bodyHeight * .02,
      ),
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(color: context.colorScheme.primary)
            : null,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.surface,
              border: Border.all(color: context.colorScheme.outline),
            ),
            child: AppImage.asset(
              Assets.icons.pinLocation02,
              color: context.colorScheme.primary,
              height: SizeConfig.bodyHeight * .02,
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: address.name ?? "",
                  fontWeight: FontWeight.w500,
                  textSize: 12,
                ),
                7.verticalSpace,
                AppText(
                  text: address.notes ?? "",
                  textSize: 11,
                  maxLines: 2,
                  color: context.colorScheme.shadow,
                ),
              ],
            ),
          ),
          10.horizontalSpace,
          AppImage.asset(
            Assets.icons.tickCircle,
            height: SizeConfig.bodyHeight * .03,
          ),
        ],
      ),
    );
  }
}
