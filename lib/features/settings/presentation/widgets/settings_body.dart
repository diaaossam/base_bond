import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/settings/presentation/widgets/settings_list_design.dart';
import 'package:flutter/material.dart';

import 'info_card_design.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InfoCardDesign(),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            SettingsListDesign(),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      ),
    );
  }
}
