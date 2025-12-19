import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/main/data/models/banners_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../../core/utils/app_size.dart';
import '../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../../core/bloc/widget/base_state_ui.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../cubit/banner/banners_cubit.dart';

class HomeBannersImage extends StatefulWidget {
  final double? height;

  const HomeBannersImage({super.key, this.height});

  @override
  State<HomeBannersImage> createState() => _HomeBannersImageState();
}

class _HomeBannersImageState extends State<HomeBannersImage> {
  int bannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BannersCubit>(),
      child: BlocBuilder<BannersCubit, BaseState<List<BannersModel>>>(
        builder: (context, state) {
          return AppApiResponse<BannersCubit, List<BannersModel>>(
            cubit: context.read<BannersCubit>(),
            /*onLoading: () => SliverToBoxAdapter(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.bodyHeight * .22,
                ),
              ),
            ),*/
            onSuccess: (data) => SliverToBoxAdapter(
              child: Visibility(
                visible: data.isNotEmpty,
                child: Column(
                  children: [
                    CarouselSlider(
                      items: data
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: SizeConfig.screenWidth,
                              child: CachedNetworkImage(
                                imageUrl: e.image ?? "",
                                cacheKey: e.image ?? "",
                                width: SizeConfig.screenWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        onPageChanged: (index, reason) =>
                            setState(() => bannerIndex = index),
                        viewportFraction: 0.85,
                        height: widget.height ?? SizeConfig.bodyHeight * .25,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                        scrollPhysics: const BouncingScrollPhysics(),
                      ),
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .01),
                    AnimatedSmoothIndicator(
                      activeIndex: bannerIndex,
                      count: data.length,
                      effect: WormEffect(
                        activeDotColor: context.colorScheme.primary,
                        dotColor: Colors.grey.shade300,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
