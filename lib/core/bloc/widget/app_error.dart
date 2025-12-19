import 'package:flutter/material.dart';

class AppErrorOverlay {
  static OverlayEntry? _entry;

  static void show(
    BuildContext context, {
    required String message,
    VoidCallback? onRetry,
  }) {
    _entry?.remove();

    _entry = OverlayEntry(
      builder: (_) => Positioned(
        top: MediaQuery.of(context).padding.top + 12,
        left: 16,
        right: 16,
        child: _ErrorBanner(message: message, onRetry: onRetry),
      ),
    );

    Overlay.of(context).insert(_entry!);

    Future.delayed(const Duration(seconds: 4), () {
      _entry?.remove();
      _entry = null;
    });
  }
}

class _ErrorBanner extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const _ErrorBanner({required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(12),
      color: Colors.red.shade600,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
            if (onRetry != null)
              TextButton(
                onPressed: onRetry,
                child: const Text(
                  'Retry',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
