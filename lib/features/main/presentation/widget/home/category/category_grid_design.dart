import 'package:bond/features/main/presentation/widget/home/category/category_item_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/category_model.dart';

class CategoriesGrid extends StatefulWidget {
  final List<CategoryModel> categories;

  const CategoriesGrid({required this.categories});

  @override
  State<CategoriesGrid> createState() => CategoriesGridState();
}

class CategoriesGridState extends State<CategoriesGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _scaleAnimations;
  late List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _initAnimations();
    _controller.forward();
  }

  void _initAnimations() {
    _scaleAnimations = List.generate(widget.categories.length, (index) {
      final start = (index * 0.1).clamp(0.0, 0.6);
      final end = (start + 0.4).clamp(0.0, 1.0);
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeOutBack),
        ),
      );
    });

    _fadeAnimations = List.generate(widget.categories.length, (index) {
      final start = (index * 0.1).clamp(0.0, 0.6);
      final end = (start + 0.3).clamp(0.0, 1.0);
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 0.85,
        ),
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimations[index].value,
                child: Opacity(
                  opacity: _fadeAnimations[index].value,
                  child: CategoryItemDesign(
                    category: widget.categories[index],
                    index: index,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
