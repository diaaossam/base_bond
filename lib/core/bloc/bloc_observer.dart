import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Enhanced BlocObserver with comprehensive logging and error tracking
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      debugPrint('🟢 BLOC CREATED: ${bloc.runtimeType}');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      debugPrint(
        '🔄 BLOC CHANGE: ${bloc.runtimeType}\n'
        '   Current: ${change.currentState}\n'
        '   Next: ${change.nextState}',
      );
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      debugPrint(
        '❌ BLOC ERROR: ${bloc.runtimeType}\n'
        '   Error: $error\n'
        '   StackTrace: $stackTrace',
      );
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(BlocBase bloc, Object? event) {
    // onEvent is only called for Bloc, not Cubit
    if (bloc is Bloc) {
      super.onEvent(bloc, event);
      if (kDebugMode) {
        debugPrint('📨 BLOC EVENT: ${bloc.runtimeType} - $event');
      }
    }
  }

  @override
  void onTransition(BlocBase bloc, Transition transition) {
    // onTransition is only called for Bloc, not Cubit
    if (bloc is Bloc) {
      super.onTransition(bloc, transition);
      if (kDebugMode) {
        debugPrint(
          '🔄 BLOC TRANSITION: ${bloc.runtimeType}\n'
          '   Event: ${transition.event}\n'
          '   Current: ${transition.currentState}\n'
          '   Next: ${transition.nextState}',
        );
      }
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      debugPrint('🔴 BLOC CLOSED: ${bloc.runtimeType}');
    }
  }
}
