import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../widgets/main_widget/app_text.dart';

class EmptyMessageDesign extends StatelessWidget {
  const EmptyMessageDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _AnimatedChatIcon(),
          SizedBox(height: 24.h),
          AppText.title(
            text: context.localizations.startConversation,
            textSize: 18,
          ),
          SizedBox(height: 8.h),
          AppText.hint(
            text: context.localizations.startConversationHint,
            textSize: 13,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _AnimatedChatIcon extends StatefulWidget {
  @override
  State<_AnimatedChatIcon> createState() => _AnimatedChatIconState();
}

class _AnimatedChatIconState extends State<_AnimatedChatIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(
      begin: -10,
      end: 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bounceAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _bounceAnimation.value),
          child: Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.primary.withValues(alpha: 0.2),
                  context.colorScheme.primary.withValues(alpha: 0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.primary.withValues(alpha: 0.2),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(
              Icons.chat_bubble_outline_rounded,
              size: 48.sp,
              color: context.colorScheme.primary,
            ),
          ),
        );
      },
    );
  }
}
