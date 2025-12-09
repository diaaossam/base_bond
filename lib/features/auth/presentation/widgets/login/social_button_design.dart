import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/base_state_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../../core/bloc/base_bloc_ui.dart';
import '../../../../../core/enum/social_enum.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../cubit/social_login/social_login_bloc.dart';

class SocialButtonDesign extends StatelessWidget {
  const SocialButtonDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return AppApiBlocResponse<SocialLoginBloc, SocialLoginEvent, void>(
      bloc: sl<SocialLoginBloc>(),
      onSuccess: (data) {
        final bloc = context.read<SocialLoginBloc>();
        return socialButton(
          socialEnum: SocialEnum.google,
          bloc: bloc,
          context: context,
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
      onTap: () async {
        if (socialEnum == SocialEnum.google) {
          bloc.add(LoginWithSocial(socialEnum: SocialEnum.google));
        } else {
          bloc.add(LoginWithSocial(socialEnum: SocialEnum.apple));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          border: Border.all(color: context.colorScheme.outline),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.horizontalSpace,
            if (socialEnum == SocialEnum.google)
              AppImage.asset(Assets.icons.google)
            else
              AppImage.asset(Assets.icons.apple),
          ],
        ),
      ),
    );
  }
}
