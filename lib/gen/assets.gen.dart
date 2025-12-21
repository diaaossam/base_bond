// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Heart.svg
  String get heart => 'assets/icons/Heart.svg';

  /// File path: assets/icons/Heart2.svg
  String get heart2 => 'assets/icons/Heart2.svg';

  /// File path: assets/icons/apple.svg
  String get apple => 'assets/icons/apple.svg';

  /// File path: assets/icons/arrow3.svg
  String get arrow3 => 'assets/icons/arrow3.svg';

  /// File path: assets/icons/arrow_back.svg
  String get arrowBack => 'assets/icons/arrow_back.svg';

  /// File path: assets/icons/arrow_down.svg
  String get arrowDown => 'assets/icons/arrow_down.svg';

  /// File path: assets/icons/arrow_forward.svg
  String get arrowForward => 'assets/icons/arrow_forward.svg';

  /// File path: assets/icons/arrow_top.svg
  String get arrowTop => 'assets/icons/arrow_top.svg';

  /// File path: assets/icons/camera.svg
  String get camera => 'assets/icons/camera.svg';

  /// File path: assets/icons/category.svg
  String get category => 'assets/icons/category.svg';

  /// File path: assets/icons/edit-2.svg
  String get edit2 => 'assets/icons/edit-2.svg';

  /// File path: assets/icons/egypt.svg
  String get egypt => 'assets/icons/egypt.svg';

  /// File path: assets/icons/female.svg
  String get female => 'assets/icons/female.svg';

  /// File path: assets/icons/gallery.svg
  String get gallery => 'assets/icons/gallery.svg';

  /// File path: assets/icons/google.svg
  String get google => 'assets/icons/google.svg';

  /// File path: assets/icons/governorate.svg
  String get governorate => 'assets/icons/governorate.svg';

  /// File path: assets/icons/home_active.svg
  String get homeActive => 'assets/icons/home_active.svg';

  /// File path: assets/icons/home_inactive.svg
  String get homeInactive => 'assets/icons/home_inactive.svg';

  /// File path: assets/icons/logo.svg
  String get logo => 'assets/icons/logo.svg';

  /// File path: assets/icons/male.svg
  String get male => 'assets/icons/male.svg';

  /// File path: assets/icons/notification.svg
  String get notification => 'assets/icons/notification.svg';

  /// File path: assets/icons/orders.svg
  String get orders => 'assets/icons/orders.svg';

  /// File path: assets/icons/phone.svg
  String get phone => 'assets/icons/phone.svg';

  /// File path: assets/icons/region.svg
  String get region => 'assets/icons/region.svg';

  /// File path: assets/icons/search-normal.svg
  String get searchNormal => 'assets/icons/search-normal.svg';

  /// File path: assets/icons/settings.svg
  String get settings => 'assets/icons/settings.svg';

  /// File path: assets/icons/shopping-cart.svg
  String get shoppingCart => 'assets/icons/shopping-cart.svg';

  /// File path: assets/icons/star-filled.svg
  String get starFilled => 'assets/icons/star-filled.svg';

  /// File path: assets/icons/user.svg
  String get user => 'assets/icons/user.svg';

  /// List of all assets
  List<String> get values => [
    heart,
    heart2,
    apple,
    arrow3,
    arrowBack,
    arrowDown,
    arrowForward,
    arrowTop,
    camera,
    category,
    edit2,
    egypt,
    female,
    gallery,
    google,
    governorate,
    homeActive,
    homeInactive,
    logo,
    male,
    notification,
    orders,
    phone,
    region,
    searchNormal,
    settings,
    shoppingCart,
    starFilled,
    user,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background_splash.png
  AssetGenImage get backgroundSplash =>
      const AssetGenImage('assets/images/background_splash.png');

  /// File path: assets/images/boarding1.jpg
  AssetGenImage get boarding1 =>
      const AssetGenImage('assets/images/boarding1.jpg');

  /// File path: assets/images/boarding2.jpg
  AssetGenImage get boarding2 =>
      const AssetGenImage('assets/images/boarding2.jpg');

  /// File path: assets/images/boarding3.jpg
  AssetGenImage get boarding3 =>
      const AssetGenImage('assets/images/boarding3.jpg');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/person.jpg
  AssetGenImage get person => const AssetGenImage('assets/images/person.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
    backgroundSplash,
    boarding1,
    boarding2,
    boarding3,
    logo,
    person,
  ];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env.development';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
