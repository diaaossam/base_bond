import 'package:auto_route/annotations.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/main/data/models/category_model.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../main/presentation/cubit/category/category_cubit.dart';

@RoutePage()
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryCubit>()..getCategories(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'جميع الأقسام',
          showBackButton: false,
        ),
        body: BlocBuilder<CategoryCubit, BaseState<List<CategoryModel>>>(
          builder: (context, state) {
            if (state.isLoading) {
              return _AllCategoriesShimmer();
            }

            final categories = state.data ?? [];
            if (categories.isEmpty) {
              return _EmptyCategories();
            }

            return _AllCategoriesGrid(categories: categories);
          },
        ),
      ),
    );
  }
}

class _AllCategoriesGrid extends StatefulWidget {
  final List<CategoryModel> categories;

  const _AllCategoriesGrid({required this.categories});

  @override
  State<_AllCategoriesGrid> createState() => _AllCategoriesGridState();
}

class _AllCategoriesGridState extends State<_AllCategoriesGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100 * widget.categories.length + 400),
    );

    _animations = List.generate(
      widget.categories.length,
      (index) {
        final start = (index * 0.05).clamp(0.0, 0.7);
        final end = (start + 0.3).clamp(0.0, 1.0);
        return Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(start, end, curve: Curves.easeOutCubic),
          ),
        );
      },
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.8,
      ),
      itemCount: widget.categories.length,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 30 * (1 - _animations[index].value)),
              child: Opacity(
                opacity: _animations[index].value,
                child: _AllCategoryItem(
                  category: widget.categories[index],
                  index: index,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _AllCategoryItem extends StatefulWidget {
  final CategoryModel category;
  final int index;

  const _AllCategoryItem({
    required this.category,
    required this.index,
  });

  @override
  State<_AllCategoryItem> createState() => _AllCategoryItemState();
}

class _AllCategoryItemState extends State<_AllCategoryItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        // TODO: Navigate to category products
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: _isPressed
                    ? context.colorScheme.primary.withOpacity(0.15)
                    : Colors.black.withOpacity(0.05),
                blurRadius: _isPressed ? 20 : 12,
                spreadRadius: _isPressed ? 2 : 0,
                offset: Offset(0, _isPressed ? 8 : 5),
              ),
            ],
          ),
          child: Column(
            children: [
              // Image Container
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        _getCategoryColor(widget.index).withOpacity(0.12),
                        _getCategoryColor(widget.index).withOpacity(0.04),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Main Image
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: AppImage.network(
                            remoteImage: widget.category.image ?? '',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // Decorative circle
                      Positioned(
                        top: -15,
                        right: -15,
                        child: Container(
                          width: 50.w,
                          height: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _getCategoryColor(widget.index)
                                .withOpacity(0.08),
                          ),
                        ),
                      ),
                      // Another decorative element
                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _getCategoryColor(widget.index)
                                .withOpacity(0.1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Title
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20.r),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.category.title ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: context.colorScheme.onSurface,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(int index) {
    final colors = [
      const Color(0xFF6366F1),
      const Color(0xFF8B5CF6),
      const Color(0xFFEC4899),
      const Color(0xFF14B8A6),
      const Color(0xFFF59E0B),
      const Color(0xFF3B82F6),
      const Color(0xFF10B981),
      const Color(0xFFEF4444),
      const Color(0xFF06B6D4),
    ];
    return colors[index % colors.length];
  }
}

class _AllCategoriesShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 0.8,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20.r),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _EmptyCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.category_outlined,
            size: 80.sp,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: 16.h),
          Text(
            'لا توجد أقسام متاحة',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom AnimatedBuilder widget
class AnimatedBuilder extends AnimatedWidget {
  final Widget Function(BuildContext context, Widget? child) builder;
  final Widget? child;

  const AnimatedBuilder({
    super.key,
    required Animation<double> animation,
    required this.builder,
    this.child,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return builder(context, child);
  }
}
