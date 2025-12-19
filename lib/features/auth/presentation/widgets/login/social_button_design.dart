import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../../core/bloc/widget/base_state_ui.dart';
import '../../../../../core/enum/social_enum.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../cubit/social_login/social_login_bloc.dart';

class SocialButtonDesign extends StatelessWidget {
  const SocialButtonDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return AppApiResponse<SocialLoginBloc, void>(
      cubit: sl<SocialLoginBloc>(),
      onStateChanged: (state) {},
      onSuccess: (data) {
        final bloc = context.read<SocialLoginBloc>();
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: context.colorScheme.shadow,
                  ),
                ),
                10.horizontalSpace,
                AppText(text: context.localizations.or),
                10.horizontalSpace,
                Expanded(
                  child: Container(
                    height: 1,
                    color: context.colorScheme.shadow,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                socialButton(
                  socialEnum: SocialEnum.google,
                  bloc: bloc,
                  context: context,
                ),
                20.verticalSpace,
                socialButton(
                  socialEnum: SocialEnum.apple,
                  bloc: bloc,
                  context: context,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget socialButton({
    required SocialEnum socialEnum,
    required SocialLoginBloc bloc,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () async => bloc.loginWithSocial(socialEnum: socialEnum),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          border: Border.all(color: context.colorScheme.onPrimary),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: AppText.body(
                text: socialEnum == SocialEnum.google
                    ? context.localizations.loginViaGoogle
                    : context.localizations.loginViaApple,
              ),
            ),
            AppImage.asset(
              socialEnum == SocialEnum.google
                  ? Assets.icons.google
                  : Assets.icons.apple,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
