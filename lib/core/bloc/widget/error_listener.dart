import 'dart:async';
import 'package:flutter/material.dart';
import '../../utils/app_constant.dart';
import '../helper/error_emitter.dart';

/// Widget يستمع للأخطاء من جميع الـ Cubits ويعرضها في toast
/// 
/// استخدم هذا الـ widget في جذر التطبيق (MaterialApp أو الصفحة الرئيسية)
/// 
/// Example:
/// ```dart
/// ErrorListener(
///   child: MaterialApp(...),
/// )
/// ```
class ErrorListener extends StatefulWidget {
  final Widget child;

  const ErrorListener({
    super.key,
    required this.child,
  });

  @override
  State<ErrorListener> createState() => _ErrorListenerState();
}

class _ErrorListenerState extends State<ErrorListener> {
  final _errorEmitter = ErrorEmitter();
  StreamSubscription<String>? _errorSubscription;

  @override
  void initState() {
    super.initState();
    _listenToErrors();
  }

  void _listenToErrors() {
    _errorSubscription = _errorEmitter.errorStream.listen((error) {
      if (mounted && error.isNotEmpty) {
        // عرض الخطأ في toast
        AppConstant.showToast(
          msg: error,
          color: Colors.red,
        );
      }
    });
  }

  @override
  void dispose() {
    _errorSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

