import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/bloc/helper/base_state.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/my_address.dart';
import '../../cubit/my_address/my_address_cubit.dart';

class MyAddressHeader extends StatelessWidget {
  const MyAddressHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyAddressCubit, BaseState<List<MyAddress>>>(
      builder: (context, state) {
        final addressCount = state.data?.length ?? 0;
        final defaultAddress = state.data?.firstWhere(
          (e) => e.isDefault == true,
          orElse: () => MyAddress(),
        );

        return Container(
              margin: EdgeInsets.all(10.w),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primary,
                    context.colorScheme.primary.withValues(alpha: 0.85),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: AppImage.asset(
                      Assets.icons.mapsLocation01,
                      color: Colors.white,
                      height: 28.h,
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: AppText(
                            text: context.localizations.myAddresses,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            textSize: 12,
                          ),
                        ),
                        8.horizontalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.25),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: AppText(
                            text: '$addressCount',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            textSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            .animate()
            .fadeIn(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
            )
            .slideY(
              begin: -0.02,
              end: 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
      },
    );
  }
}
