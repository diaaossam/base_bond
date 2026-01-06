import 'package:bond/core/bloc/global_cubit/global_cubit.dart';
import 'package:bond/core/enum/language.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Language Dialog',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const LanguageDialog();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final slideAnimation = Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ));

        final fadeAnimation = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: const Interval(0, 0.6, curve: Curves.easeOut),
        ));

        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    );
  }

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog>
    with TickerProviderStateMixin {
  late AnimationController _waveController;
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;

  Language? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _floatController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final globalCubit = context.read<GlobalCubit>();
      setState(() {
        _selectedLanguage = globalCubit.language;
      });
    });
  }

  @override
  void dispose() {
    _waveController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          color: context.colorScheme.surfaceContainer,
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.primary.withValues(alpha: 0.12),
              blurRadius: 40,
              spreadRadius: 0,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.r),
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                // Decorative background circles
                Positioned(
                  top: -30.h,
                  right: -30.w,
                  child: _buildDecorativeCircle(
                    100.w,
                    context.colorScheme.primary.withValues(alpha: 0.08),
                  ),
                ),
                Positioned(
                  bottom: -40.h,
                  left: -40.w,
                  child: _buildDecorativeCircle(
                    120.w,
                    context.colorScheme.secondary.withValues(alpha: 0.06),
                  ),
                ),
                // Content
                Padding(
                  padding: EdgeInsets.all(28.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildHeader(),
                      36.verticalSpace,
                      _buildLanguageOptions(),
                      32.verticalSpace,
                      _buildActionButtons(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDecorativeCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _floatAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _floatAnimation.value),
              child: Container(
                width: 90.w,
                height: 90.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF667eea),
                      Color(0xFF764ba2),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF667eea).withValues(alpha: 0.35),
                      blurRadius: 25,
                      spreadRadius: 0,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Rotating globe lines
                    AnimatedBuilder(
                      animation: _waveController,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _waveController.value * 2 * 3.14159,
                          child: CustomPaint(
                            size: Size(70.w, 70.w),
                            painter: _GlobeLinesPainter(),
                          ),
                        );
                      },
                    ),
                    Icon(
                      Icons.language_rounded,
                      size: 40.sp,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        24.verticalSpace,
        AppText.title(
          text: context.localizations.language,
          fontWeight: FontWeight.w700,
          textSize: 22,
        ),
        10.verticalSpace,
        AppText.hint(
          text: context.localizations.languageHint,
          textSize: 13,
        ),
      ],
    );
  }

  Widget _buildLanguageOptions() {
    return Column(
      children: [
        _buildLanguageOption(
          language: Language.arabic,
          title: 'العربية',
          subtitle: 'Arabic',
          flag: '🇪🇬',
          gradientColors: [
            const Color(0xFF2ecc71),
            const Color(0xFF27ae60),
          ],
        ),
        16.verticalSpace,
        _buildLanguageOption(
          language: Language.english,
          title: 'English',
          subtitle: 'الإنجليزية',
          flag: '🇺🇸',
          gradientColors: [
            const Color(0xFF3498db),
            const Color(0xFF2980b9),
          ],
        ),
      ],
    );
  }

  Widget _buildLanguageOption({
    required Language language,
    required String title,
    required String subtitle,
    required String flag,
    required List<Color> gradientColors,
  }) {
    final isSelected = _selectedLanguage == language;

    return GestureDetector(
      onTap: () => setState(() => _selectedLanguage = language),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    gradientColors[0].withValues(alpha: 0.15),
                    gradientColors[1].withValues(alpha: 0.08),
                  ],
                )
              : null,
          color: isSelected ? null : context.colorScheme.surface,
          border: Border.all(
            color: isSelected ? gradientColors[0] : context.colorScheme.outline,
            width: isSelected ? 2.5 : 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: gradientColors[0].withValues(alpha: 0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            // Flag container with animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 54.w,
              height: 54.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isSelected
                      ? gradientColors
                      : [
                          context.colorScheme.outline.withValues(alpha: 0.5),
                          context.colorScheme.outline.withValues(alpha: 0.3),
                        ],
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: gradientColors[0].withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
              child: Center(
                child: Text(
                  flag,
                  style: TextStyle(fontSize: 28.sp),
                ),
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: title,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                    textSize: 13,
                    color: isSelected ? gradientColors[0] : null,
                  ),
                  4.verticalSpace,
                  AppText.hint(
                    text: subtitle,
                    textSize: 11,
                  ),
                ],
              ),
            ),
            // Radio indicator with animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isSelected
                    ? LinearGradient(
                        colors: gradientColors,
                      )
                    : null,
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : context.colorScheme.outline,
                  width: 2.5,
                ),
              ),
              child: isSelected
                  ? TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 300),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        );
                      },
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50.h,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: context.colorScheme.shadow,
                side: BorderSide(
                  color: context.colorScheme.outline,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: AppText(
                text: context.localizations.cancel,
                fontWeight: FontWeight.w600,
                textSize: 12,
                color: context.colorScheme.shadow,
              ),
            ),
          ),
        ),
        16.horizontalSpace,
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {
                if (_selectedLanguage != null) {
                  context
                      .read<GlobalCubit>()
                      .changeLanguage(lang: _selectedLanguage!);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_rounded, size: 20.sp),
                  8.horizontalSpace,
                  AppText(
                    text: context.localizations.confirm,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    textSize: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GlobeLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    // Draw horizontal lines
    for (int i = 1; i < 4; i++) {
      final y = size.height * i / 4;
      final dx = radius * (1 - (2 * (y - center.dy) / size.height).abs());
      canvas.drawLine(
        Offset(center.dx - dx, y),
        Offset(center.dx + dx, y),
        paint,
      );
    }

    // Draw vertical arc
    canvas.drawArc(
      Rect.fromCenter(center: center, width: size.width - 8, height: size.height - 8),
      0,
      3.14159,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}















