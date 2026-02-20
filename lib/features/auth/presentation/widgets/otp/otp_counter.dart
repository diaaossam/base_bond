import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class OtpTimerDesign extends StatefulWidget {
  final VoidCallback? onFinish;
  final VoidCallback? onResendTap;
  final bool canResend;

  const OtpTimerDesign({
    super.key,
    this.onFinish,
    this.onResendTap,
    this.canResend = false,
  });

  @override
  State<OtpTimerDesign> createState() => OtpTimerDesignState();
}

class OtpTimerDesignState extends State<OtpTimerDesign> {
  Timer? _timer;
  late int _countdown;

  @override
  void initState() {
    super.initState();
    _countdown = 60;
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void resetTimer() {
    _timer?.cancel();
    _countdown = 60;
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSecond,
      (Timer timer) => setState(() {
        if (_countdown < 1) {
          widget.onFinish?.call();
          timer.cancel();
        } else {
          _countdown--;
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final canTap = widget.canResend || _countdown < 1;
    return GestureDetector(
      onTap: canTap ? widget.onResendTap : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: context.localizations.dontReceiveCode,
            color: context.colorScheme.shadow,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(width: 5),
          AppText(
            text: context.localizations.resendCode,
            color: canTap
                ? context.colorScheme.tertiary
                : context.colorScheme.shadow,
            fontWeight: FontWeight.w600,
          ),
          if (_countdown > 0) ...[
            const SizedBox(width: 5),
            AppText(
              text: "($_countdown)",
              color: context.colorScheme.shadow,
              fontWeight: FontWeight.w600,
            ),
          ],
        ],
      ),
    );
  }
}
