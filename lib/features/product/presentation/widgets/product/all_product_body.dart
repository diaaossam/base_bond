import 'dart:async';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/product/presentation/cubit/product_cubit.dart';
import 'package:bond/features/product/presentation/cubit/wishlist/wishlist_cubit.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/product_filter_bottom_sheet.dart';
import 'package:bond/features/product/presentation/widgets/product/products_pagination_grid_list.dart';
import 'package:bond/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../data/models/request/product_params.dart';
import '../../../data/models/response/product_model.dart';

class AllProductBody extends StatefulWidget {
  final ProductParams initialParams;
  final bool fromHome;
  const AllProductBody({super.key, required this.initialParams, required this.fromHome});

  @override
  State<AllProductBody> createState() => _AllProductBodyState();
}

class _AllProductBodyState extends State<AllProductBody> {
  late PagingController<int, ProductModel> _pagingController;
  late ProductCubit bloc;
  ProductParams _currentParams = const ProductParams();
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        CustomSliverAppBar(
          showLeading: false,
          titleWidget: CustomTextFormField(
            hintText: context.localizations.searchHint,
            onChanged: _onQueryChanged,
            prefixIcon: AppImage.asset(Assets.icons.searchNormal),
          ),
          actions: [
            InkWell(
              onTap: () => _showFilterDialog(context),
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.surfaceContainer,
                ),
                child: AppImage.asset(
                  Assets.icons.filter,
                  color: context.colorScheme.shadow,
                ),
              ),
            ),
            20.horizontalSpace,
          ],
        ),
      ],
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 20.h,),),
          BlocBuilder<WishlistCubit, BaseState>(
            builder: (context, state) {
              return ProductsPaginationGridList(
                pagingController: _pagingController,
                onFavTapped: (data, item) {
                  item.isAddedToFavourite = data;
                  context.read<WishlistCubit>().toggleWishList(
                    productId: item.id ?? 0,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _currentParams = widget.initialParams;
    bloc = sl<ProductCubit>();
    _pagingController = PagingController<int, ProductModel>(
      getNextPageKey: (state) =>
          state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (int pageKey) {
        _currentParams = _currentParams.copyWith(page: pageKey);
        return bloc.getPaginationProducts(_currentParams);
      },
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onQueryChanged(String? value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      if (value!.isNotEmpty) {
        setState(
          () =>
              _currentParams = _currentParams.copyWith(search: value, page: 1),
        );
        _pagingController.refresh();
      }
    });
  }

  void _showFilterDialog(BuildContext context) {
    ProductFilterBottomSheet.show(
      context,
      initialParams: _currentParams,
      onApplyFilter: (ProductParams params) {
        setState(() => _currentParams = params);
        _pagingController.refresh();
      },
    );
  }
}
