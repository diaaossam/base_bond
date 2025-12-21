import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/extensions/color_extensions.dart';
import '../../../../../../widgets/image_picker/app_image.dart';
import '../../../../main/data/models/category_model.dart';

class CategoryItemDesign extends StatefulWidget {
  final CategoryModel category;
  final int index;

  const CategoryItemDesign({
    super.key,
    required this.category,
    required this.index,
  });

  @override
  State<CategoryItemDesign> createState() => CategoryItemDesignState();
}

class CategoryItemDesignState extends State<CategoryItemDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _hoverController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: (_) {
              setState(() => _isPressed = true);
              _hoverController.forward();
            },
            onTapUp: (_) {
              setState(() => _isPressed = false);
              _hoverController.reverse();
            },
            onTapCancel: () {
              setState(() => _isPressed = false);
              _hoverController.reverse();
            },
            onTap: () {
              // TODO: Navigate to category products
            },
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: _isPressed
                        ? context.colorScheme.primary.withOpacity(0.2)
                        : Colors.black.withOpacity(0.06),
                    blurRadius: _isPressed ? 15 : 10,
                    spreadRadius: _isPressed ? 1 : 0,
                    offset: Offset(0, _isPressed ? 6 : 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.r),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            _getCategoryColor(widget.index).withOpacity(0.15),
                            _getCategoryColor(widget.index).withOpacity(0.05),
                          ],
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.r),
                        ),
                        child: Stack(
                          children: [
                            // Category Image
                            Positioned.fill(
                              child: Padding(
                                padding: EdgeInsets.all(12.w),
                                child: AppImage.network(
                                  remoteImage: widget.category.image ?? '',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            // Subtle shine effect
                            Positioned(
                              top: -20,
                              right: -20,
                              child: Container(
                                width: 60.w,
                                height: 60.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: RadialGradient(
                                    colors: [
                                      Colors.white.withOpacity(0.3),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(16.r),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        widget.category.title ?? '',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSurface,
                        ),
                        maxLines: 1,
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
      },
    );
  }

  Color _getCategoryColor(int index) {
    final colors = [
      const Color(0xFF6366F1), // Indigo
      const Color(0xFF8B5CF6), // Purple
      const Color(0xFFEC4899), // Pink
      const Color(0xFF14B8A6), // Teal
      const Color(0xFFF59E0B), // Amber
      const Color(0xFF3B82F6), // Blue
    ];
    return colors[index % colors.length];
  }
}
