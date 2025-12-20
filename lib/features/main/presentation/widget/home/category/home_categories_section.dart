import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/main/data/models/category_model.dart';
import 'package:bond/features/main/presentation/widget/home/category/shimmer_category.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../../../core/extensions/color_extensions.dart';
import '../../../../../../widgets/section_header.dart';
import '../../../cubit/category/category_cubit.dart';
import 'category_grid_design.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryCubit>()..getCategories(),
      child: BlocBuilder<CategoryCubit, BaseState<List<CategoryModel>>>(
        builder: (context, state) {
          if (state.isLoading) {
            return SliverToBoxAdapter(child: CategoryShimmer());
          }

          final categories = state.data ?? [];
          if (categories.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }
          final displayCategories = categories.take(6).toList();
          return SliverToBoxAdapter(
            child: Column(
              children: [
                SectionHeader(
                  title: context.localizations.categories,
                  actionText: context.localizations.seeAll,
                  onActionTap: () {
                    context.tabsRouter.setActiveIndex(1);
                  },
                ),
                CategoriesGrid(categories: displayCategories),
              ],
            ),
          );
        },
      ),
    );
  }
}




