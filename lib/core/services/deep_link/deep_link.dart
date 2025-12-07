import 'dart:developer';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import '../../../config/helper/context_helper.dart';

final class DynamicLinkHandler {
  DynamicLinkHandler._();

  static final instance = DynamicLinkHandler._();

  final _appLinks = AppLinks();

  Future<void> initialize({required Function(void) callback}) async {
    _appLinks.uriLinkStream.listen(_handleLinkData).onError((error) {
      log('$error', name: 'Dynamic Link Handler');
    });
    _checkInitialLink(callback: callback);
  }

  Future<void> _checkInitialLink({required Function(void) callback}) async {
    final initialLink = await _appLinks.getInitialLink();
    if (initialLink != null) {
      _handleLinkData(initialLink);
    } else {
      callback(null);
    }
  }

  /// Handles the link navigation Dynamic Links.
  void _handleLinkData(Uri data) async {
    try {

      BuildContext? context = NavigationService.navigatorKey.currentContext;

      if (context == null) {
        log('Context is null, cannot navigate', name: 'Dynamic Link Handler');
        return;
      }

      String path = data.path;

      if (path.isEmpty || path == '/') {
        log('Empty path, ignoring', name: 'Dynamic Link Handler');
        return;
      }

      // Remove leading slash if exists
      if (path.startsWith('/')) {
        path = path.substring(1);
      }

      // Split path into segments
      final segments = path.split('/');
      log('Path segments: $segments', name: 'Dynamic Link Handler');

      // Find product ID
      String? productIdStr;
      if (segments.contains('product') || segments.contains('products')) {
        final productIndex = segments.contains('product')
            ? segments.indexOf('product')
            : segments.indexOf('products');

        if (productIndex != -1 && segments.length > productIndex + 1) {
          productIdStr = segments[productIndex + 1];
        }
      } else if (segments.isNotEmpty) {
        productIdStr = segments.last;
      }

      if (productIdStr == null || productIdStr.isEmpty) {
        log('Could not extract product ID', name: 'Dynamic Link Handler');
        return;
      }

      // Parse product ID
      final productId = num.tryParse(productIdStr);

      if (productId == null) {
        log('Invalid product ID: $productIdStr', name: 'Dynamic Link Handler');
        return;
      }

      log('Navigating to product: $productId', name: 'Dynamic Link Handler');


    } catch (e) {

    }
  }
}
