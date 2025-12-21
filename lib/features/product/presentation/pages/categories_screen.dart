import 'package:auto_route/annotations.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/main/data/models/category_model.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../main/presentation/cubit/category/category_cubit.dart';
import '../widgets/category/category_grid_design.dart';
import '../widgets/category/empty_category_design.dart';
import '../widgets/category/shimmer_category.dart';

@RoutePage()
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryCubit>()..getCategories(),
      child: Scaffold(
        appBar: CustomAppBar(title: context.localizations.allCategories, showBackButton: false),
        body: BlocBuilder<CategoryCubit, BaseState<List<CategoryModel>>>(
          builder: (context, state) {
            if (state.isLoading) {
              return CategoryShimmer();
            }

            final categories = state.data ?? [];
            if (categories.isEmpty) {
              return EmptyCategories();
            }
            return CategoriesGrid(categories: categories,shrinkWrap: false,);
          },
        ),
      ),
    );
  }
}
