import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class OtpTimerDesign extends StatefulWidget {
  final Function() onFinish;

  const OtpTimerDesign({super.key, required this.onFinish});

  @override
  State<OtpTimerDesign> createState() => _OtpTimerDesignState();
}

class _OtpTimerDesignState extends State<OtpTimerDesign> {
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
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: context.localizations.dontReceiveCode,
          color: context.colorScheme.shadow,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(width: 5),
        AppText(
          text: context.localizations.resendCode,
          color: context.colorScheme.tertiary,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(width: 5),
        AppText(
          text: "($_countdown)",
          color: context.colorScheme.shadow,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSecond,
      (Timer timer) => setState(() {
        if (_countdown < 1) {
          widget.onFinish();
          timer.cancel();
        } else {
          _countdown--;
        }
      }),
    );
  }

  void resetTimer() {
    _timer!.cancel();
    _countdown = 60;
    startTimer();
  }
}
