import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

extension Localizations on BuildContext {
  /// Safely get localizations, returns null if not available in widget tree
  S? get localizationsMaybe => S.maybeOf(this);
  
  /// Get localizations, throws if not available
  /// Use [localizationsMaybe] if you're not sure if localizations are available
  S get localizations {
    final maybe = S.maybeOf(this);
    if (maybe != null) return maybe;
    // Fallback: This should rarely happen, but provides a safe fallback
    throw FlutterError(
      'No instance of S present in the widget tree. '
      'Did you add S.delegate in localizationsDelegates?',
    );
  }
}
