import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/main/data/models/banners_model.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/app_size.dart';
import '../../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../../../config/router/app_router.gr.dart';
import '../../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../product/data/models/request/product_params.dart';
import '../../../cubit/banner/banners_cubit.dart';
import 'banner_indicator_design.dart';
import 'banner_shimmer.dart';

class HomeBannersImage extends StatefulWidget {
  final double? height;

  const HomeBannersImage({super.key, this.height});

  @override
  State<HomeBannersImage> createState() => _HomeBannersImageState();
}

class _HomeBannersImageState extends State<HomeBannersImage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BannersCubit>()..getBanners(),
      child: BlocBuilder<BannersCubit, BaseState<List<BannersModel>>>(
        builder: (context, state) {
          final data = state.data ?? [];
          if (state.isLoading) {
            return SliverToBoxAdapter(child: BannerShimmer());
          }
          return SliverToBoxAdapter(
            child: Visibility(
              visible: data.isNotEmpty,
              child: Column(
                children: [
                  _buildAnimatedCarousel(data),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  BannerIndicatorDesign(
                    count: data.length,
                    currentIndex: _currentIndex,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedCarousel(List<BannersModel> data) {
    return CarouselSlider.builder(
      itemCount: data.length,
      itemBuilder: (context, index, realIndex) {
        return _buildBannerItem(data[index], index);
      },
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          setState(() => _currentIndex = index);
        },
        viewportFraction: 0.9,
        height: widget.height ?? SizeConfig.bodyHeight * .25,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOutCubic,
        scrollDirection: Axis.horizontal,
        scrollPhysics: const BouncingScrollPhysics(),
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
      ),
    );
  }

  Widget _buildBannerItem(BannersModel banner, int index) {
    final isActive = index == _currentIndex;
    return GestureDetector(
      onTap: () {
        if(banner.ids != null && banner.ids!.isNotEmpty){
          context.router.push(
            AllProductsRoute(
              title: context.localizations.products,
              initialParams: ProductParams(page: 1, ids: banner.ids),
              fromHome: true,
            ),
          );
        }

      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
            margin: EdgeInsets.symmetric(
              horizontal: 4,
              vertical: isActive ? 0 : 12,
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: 'banner_${banner.id}',
                child: AppImage.network(
                  remoteImage: banner.image ?? "",
                  fit: BoxFit.cover,
                  width: SizeConfig.screenWidth,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
