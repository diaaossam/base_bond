import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/features/start/data/models/intro_model.dart';
import 'package:bond/features/start/presentation/cubit/boarding/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../../core/bloc/widget/base_state_ui.dart';
import '../../../../../core/extensions/page_controller_extention.dart';
import 'boarding_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final OnBoardingCubit cubit;
  final PageController boardController = PageController();

  @override
  void initState() {
    cubit = sl<OnBoardingCubit>();
    cubit.getIntroData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppApiResponse<OnBoardingCubit, List<IntroModel>>(
      onStateChanged: (state) {
        if (state.isSuccess && state.identifier == "submit") {
          context.router.push(LoginRoute());
        }
      },
      cubit: cubit,
      onSuccess: (data) => PageView.builder(
        onPageChanged: (index) {
          if (index == data.length - 1) {
            cubit.changePageViewState(true);
          } else {
            cubit.changePageViewState(false);
          }
        },
        itemCount: data.length,
        physics: const BouncingScrollPhysics(),
        controller: boardController,
        itemBuilder: (context, index) {
          final item = data[index];
          return BoardingContent(
            title: item.title,
            count: data.length,
            pageController: boardController,
            image: item.image,
            text: item.description,
            press: () {
              if (cubit.isLast) {
                cubit.submit();
              } else {
                boardController.toNextPage();
              }
            },
          );
        },
      ),
    );
  }
}
