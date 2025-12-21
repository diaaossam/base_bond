import 'package:bond/features/product/presentation/cubit/product_cubit.dart';
import 'package:bond/features/product/presentation/widgets/product/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../data/models/request/product_params.dart';
import '../../../data/models/response/product_model.dart';

class AllProductBody extends StatefulWidget {
  final ProductParams initialParams;

  const AllProductBody({super.key, required this.initialParams});

  @override
  State<AllProductBody> createState() => _AllProductBodyState();
}

class _AllProductBodyState extends State<AllProductBody> {
  late PagingController<int, ProductModel> _pagingController;
  late ProductCubit bloc;
  ProductParams _currentParams = const ProductParams();



  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: screenPadding(),
          sliver: PagingListener<int, ProductModel>(
            controller: _pagingController,
            builder: (context, state, fetchNextPage) => PagedSliverGrid(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate<ProductModel>(
                itemBuilder: (context, item, index) =>
                    ProductItemWidget(product: item, index: index),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .98,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.h,
              ),
            ),
          ),
        ),
      ],
    );
  }


  @override
  void initState() {
    super.initState();
    _currentParams = widget.initialParams;
    bloc = sl<ProductCubit>();
    _pagingController = PagingController<int, ProductModel>(
      getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (int pageKey) {
        _currentParams = _currentParams.copyWith(page: pageKey);
        return bloc.getPaginationProducts(_currentParams);
      },
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
