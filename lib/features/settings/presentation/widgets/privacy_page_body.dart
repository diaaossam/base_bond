import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/settings/data/models/page_model.dart';
import 'package:bond/features/settings/presentation/cubit/pages_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class PrivacyPageBody extends StatelessWidget {
  const PrivacyPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesCubit, BaseState<PageModel>>(
      builder: (context, state) {
        if (state.isLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListView.builder(
              itemCount: 16,
              itemBuilder: (context, index) => Container(
                height: 10,
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                width: double.infinity,
                color: context.colorScheme.primary,
              ),
            ),
          );
        }
        if (state.isSuccess) {
          return SingleChildScrollView(
            child: Padding(
              padding: screenPadding(),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.bodyHeight*.02,),
                  AppText(
                    text: state.data!.description.toString(),
                    maxLines: 200,
                    textHeight: 1.7,
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
