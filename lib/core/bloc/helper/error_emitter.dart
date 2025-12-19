import 'dart:async';

/// Service لإرسال الأخطاء من الـ Cubits إلى الـ UI
/// يستخدم StreamController لبث الأخطاء
class ErrorEmitter {
  static final ErrorEmitter _instance = ErrorEmitter._internal();
  factory ErrorEmitter() => _instance;
  ErrorEmitter._internal();

  final _errorController = StreamController<String>.broadcast();

  /// Stream للاستماع للأخطاء
  Stream<String> get errorStream => _errorController.stream;

  /// إرسال خطأ
  void emit(String error) {
    if (!_errorController.isClosed && error.isNotEmpty) {
      _errorController.add(error);
    }
  }

  /// تنظيف الـ resources
  void dispose() {
    _errorController.close();
  }
}

