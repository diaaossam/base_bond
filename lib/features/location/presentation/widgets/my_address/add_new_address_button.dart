import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/app_router.gr.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../cubit/my_address/my_address_cubit.dart';

class AddNewAddressButton extends StatelessWidget {
  const AddNewAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomButton(
            text: context.localizations.addNewAddress,
            press: () {
              context.router.push(AddAddressRoute()).then((_) {
                if (context.mounted) {
                  context.read<MyAddressCubit>().getMyAddress();
                }
              });
            },
          )
          .animate(delay: const Duration(milliseconds: 300))
          .scaleXY(
            begin: 0.0,
            end: 1.0,
            duration: const Duration(milliseconds: 600),
            curve: Curves.elasticOut,
          ),
    );
  }
}
