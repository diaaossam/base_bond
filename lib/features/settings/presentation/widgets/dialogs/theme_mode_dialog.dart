import 'package:bond/core/bloc/global_cubit/global_cubit.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeModeDialog extends StatefulWidget {
  const ThemeModeDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Theme Mode Dialog',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const ThemeModeDialog();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        );
        return ScaleTransition(
          scale: curvedAnimation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  @override
  State<ThemeModeDialog> createState() => _ThemeModeDialogState();
}

class _ThemeModeDialogState extends State<ThemeModeDialog>
    with TickerProviderStateMixin {
  late AnimationController _sunMoonController;
  late AnimationController _starsController;
  late Animation<double> _starsOpacity;

  ThemeMode? _selectedMode;

  @override
  void initState() {
    super.initState();
    _sunMoonController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _starsController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _starsOpacity = Tween<double>(begin: 0.3, end: 1).animate(_starsController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final globalCubit = context.read<GlobalCubit>();
      setState(() {
        _selectedMode = globalCubit.themeMode;
      });
    });
  }

  @override
  void dispose() {
    _sunMoonController.dispose();
    _starsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colorScheme.surfaceContainer,
              context.colorScheme.surfaceContainer.withValues(alpha: 0.95),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.primary.withValues(alpha: 0.15),
              blurRadius: 30,
              spreadRadius: 5,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28.r),
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeader(),
                  32.verticalSpace,
                  _buildModeSelector(),
                  32.verticalSpace,
                  _buildConfirmButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _selectedMode == ThemeMode.dark
                  ? [const Color(0xFF1a1a2e), const Color(0xFF16213e)]
                  : [const Color(0xFFffecd2), const Color(0xFFfcb69f)],
            ),
            boxShadow: [
              BoxShadow(
                color: _selectedMode == ThemeMode.dark
                    ? const Color(0xFF6366f1).withValues(alpha: 0.4)
                    : const Color(0xFFf59e0b).withValues(alpha: 0.4),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                child: ScaleTransition(scale: animation, child: child),
              );
            },
            child: _selectedMode == ThemeMode.dark
                ? _buildMoonIcon()
                : _buildSunIcon(),
          ),
        ),
        20.verticalSpace,
        AppText.title(
          text: context.localizations.mode,
          fontWeight: FontWeight.w700,
        ),
        8.verticalSpace,
        AppText.hint(
          text: _selectedMode == ThemeMode.dark
              ? context.localizations.darkMode
              : context.localizations.lightMode,
        ),
      ],
    );
  }

  Widget _buildSunIcon() {
    return TweenAnimationBuilder<double>(
      key: const ValueKey('sun'),
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value * 0.5,
          child: Icon(
            Icons.wb_sunny_rounded,
            size: 44.sp,
            color: const Color(0xFFf59e0b),
          ),
        );
      },
    );
  }

  Widget _buildMoonIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Stars animation
        AnimatedBuilder(
          animation: _starsOpacity,
          builder: (context, child) {
            return Opacity(
              opacity: _starsOpacity.value,
              child: CustomPaint(
                size: Size(60.w, 60.w),
                painter: _StarsPainter(),
              ),
            );
          },
        ),
        Icon(
          key: const ValueKey('moon'),
          Icons.nightlight_round,
          size: 40.sp,
          color: const Color(0xFFe2e8f0),
        ),
      ],
    );
  }

  Widget _buildModeSelector() {
    return Row(
      children: [
        Expanded(child: _buildModeOption(ThemeMode.light)),
        16.horizontalSpace,
        Expanded(child: _buildModeOption(ThemeMode.dark)),
      ],
    );
  }

  Widget _buildModeOption(ThemeMode mode) {
    final isSelected = _selectedMode == mode;
    final isLight = mode == ThemeMode.light;

    return GestureDetector(
      onTap: () {
        setState(() => _selectedMode = mode);
        if (!isLight) {
          _sunMoonController.forward();
        } else {
          _sunMoonController.reverse();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isLight
                      ? [
                          const Color(0xFFfef3c7),
                          const Color(0xFFfde68a),
                        ]
                      : [
                          const Color(0xFF1e1b4b),
                          const Color(0xFF312e81),
                        ],
                )
              : null,
          color: isSelected ? null : context.colorScheme.surface,
          border: Border.all(
            color: isSelected
                ? (isLight
                    ? const Color(0xFFf59e0b)
                    : const Color(0xFF6366f1))
                : context.colorScheme.outline,
            width: isSelected ? 2.5 : 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: (isLight
                            ? const Color(0xFFf59e0b)
                            : const Color(0xFF6366f1))
                        .withValues(alpha: 0.3),
                    blurRadius: 15,
                    spreadRadius: 0,
                    offset: const Offset(0, 5),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isLight
                      ? [const Color(0xFFfbbf24), const Color(0xFFf59e0b)]
                      : [const Color(0xFF4338ca), const Color(0xFF6366f1)],
                ),
              ),
              child: Icon(
                isLight ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                color: Colors.white,
                size: 28.sp,
              ),
            ),
            12.verticalSpace,
            AppText(
              text: isLight
                  ? context.localizations.lightMode
                  : context.localizations.darkMode,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              textSize: 11,
              color: isSelected
                  ? (isLight
                      ? const Color(0xFF92400e)
                      : const Color(0xFFe0e7ff))
                  : null,
            ),
            8.verticalSpace,
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? (isLight
                        ? const Color(0xFFf59e0b)
                        : const Color(0xFF6366f1))
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : context.colorScheme.outline,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 16.sp,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          if (_selectedMode != null) {
            context.read<GlobalCubit>().chooseAppTheme(theme: _selectedMode!);
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
          shadowColor: context.colorScheme.primary.withValues(alpha: 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline_rounded, size: 22.sp),
            8.horizontalSpace,
            AppText(
              text: context.localizations.confirm,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              textSize: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class _StarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.8)
      ..style = PaintingStyle.fill;

    // Draw small stars
    final starPositions = [
      Offset(size.width * 0.15, size.height * 0.2),
      Offset(size.width * 0.85, size.height * 0.15),
      Offset(size.width * 0.75, size.height * 0.75),
      Offset(size.width * 0.2, size.height * 0.8),
      Offset(size.width * 0.5, size.height * 0.1),
    ];

    for (final pos in starPositions) {
      canvas.drawCircle(pos, 1.5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

