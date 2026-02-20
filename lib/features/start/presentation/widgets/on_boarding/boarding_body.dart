import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/start/data/models/intro_model.dart';
import 'package:bond/features/start/presentation/cubit/boarding/on_boarding_cubit.dart';
import 'package:bond/widgets/rotate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/extensions/page_controller_extention.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import 'boarding_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}
class _BodyState extends State<Body> {
  late final OnBoardingCubit cubit;
  final PageController boardController = PageController();
  bool isLast = false;

  @override
  void initState() {
    cubit = sl<OnBoardingCubit>();
    cubit.getIntroData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, BaseState<List<IntroModel>>>(
      listener: (context, state) {
        if (state.isSuccess && state.identifier == "submit") {
          context.router.push(LoginRoute());
        }
      },
      builder: (context, state) {
        final data = state.data??[];
        return  Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if(data.isNotEmpty){
                    isLast = index == data.length - 1;
                    setState(() {});
                  }
                },
                itemCount: state.data?.length,
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
                      if (isLast) {
                        cubit.submit();
                      } else {
                        boardController.toNextPage();
                      }
                    },
                  );
                },
              ),
            ),
            Container(
              padding: screenPadding(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      if (isLast) {
                        cubit.submit();
                      } else {
                        boardController.toNextPage();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withValues(alpha: 0.7),
                      ),
                      child: Row(
                        children: [
                          AppText(
                            text:isLast ?  context.localizations.startNow:context.localizations.next,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            textSize: 12,
                          ),
                          10.horizontalSpace,
                          Rotate(child: AppImage.asset(Assets.icons.arrow3)),
                          10.horizontalSpace,
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Rotate(child: AppImage.asset(Assets.icons.arrowForward)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: boardController,
                    count: data.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: context.colorScheme.primary,
                      dotHeight: 8,
                      dotWidth: 10,
                      strokeWidth: 20,
                      expansionFactor: 4,
                      spacing: 5.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight*.02,),
          ],
        );
      },
    );

  }
}
