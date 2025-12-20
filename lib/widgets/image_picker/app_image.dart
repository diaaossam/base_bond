import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Source { assets, network, file }

class AppImage extends StatelessWidget {
  const AppImage.asset(
    this.path, {
    super.key,
    this.alignment,
    this.fit,
    this.isRotateSvg = true,
    this.height,
    this.width,
    this.color,
    this.colorFilter,
    this.loadingBuilder,
    this.failedBuilder,
    this.size,
    this.placeholder,
    this.ratio,
  }) : _source = Source.assets,
       remoteImage = null;

  const AppImage.file(
    this.path, {
    super.key,
    this.alignment,
    this.fit,
    this.isRotateSvg = true,
    this.height,
    this.width,
    this.color,
    this.colorFilter,
    this.loadingBuilder,
    this.failedBuilder,
    this.size,
    this.placeholder,
    this.ratio,
  }) : _source = Source.file,
       remoteImage = null;

  const AppImage.network({
    super.key,
    this.alignment,
    this.fit,
    this.height,
    this.width,
    this.color,
    this.isRotateSvg = false,
    this.loadingBuilder,
    this.failedBuilder,
    this.colorFilter,
    this.size,
    this.placeholder,
    this.remoteImage,
    this.ratio,
    String? path,
  }) : _source = Source.network,
       path = remoteImage ?? path ?? '';

  final Source _source;

  final String path;
  final Alignment? alignment;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final bool? isRotateSvg;
  final Color? color;
  final WidgetBuilder? loadingBuilder;
  final Widget Function(BuildContext context, String name)? placeholder;
  final String? remoteImage;
  final double? ratio;
  final double? size;
  final WidgetBuilder? failedBuilder;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    if (path.contains('.svg')) {
      switch (_source) {
        case Source.assets:
          return SvgPicture.asset(
            path,
            colorFilter:
                colorFilter ??
                (color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null),
            alignment: alignment ?? Alignment.center,
            fit: fit ?? BoxFit.contain,
            height: getHeight(),
            width: getWidth(),
          );
        case Source.network:
          return SvgPicture.network(
            path,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
            alignment: alignment ?? Alignment.center,
            fit: fit ?? BoxFit.contain,
            height: getHeight(),
            width: getWidth(),
          );
        case Source.file:
          return SvgPicture.file(
            File(path),
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
            alignment: alignment ?? Alignment.center,
            fit: fit ?? BoxFit.contain,
            height: getHeight(),
            width: getWidth(),
          );
      }
    } else {
      switch (_source) {
        case Source.assets:
          return Image.asset(
            path,
            color: color,
            alignment: alignment ?? Alignment.center,
            fit: fit,
            height: getHeight(),
            width: getWidth(),
          );
        case Source.network:
          return CachedNetworkImage(
            cacheKey: path,
            imageUrl: path,
            color: color,
            alignment: alignment ?? Alignment.center,
            fit: fit,
            height: getHeight(),
            width: getWidth(),
            placeholder: (context, url) => _buildImagePlaceholder(),
            errorWidget: (context, url, error) => _buildImagePlaceholder(),
          );
        case Source.file:
          return Image.file(
            File(path),
            color: color,
            alignment: alignment ?? Alignment.center,
            fit: fit,
            height: getHeight(),
            width: getWidth(),
          );
      }
    }
  }

  double? getHeight() => size ?? height;

  double? getWidth() => size ?? width;

  Widget getLoadingBuilder(BuildContext context) => loadingBuilder != null
      ? loadingBuilder!(context)
      : SizedBox(
          height: getHeight(),
          width: getWidth(),
          child: const CircularProgressIndicator(strokeWidth: 1),
        );

  Widget copyWith(Color? color) {
    return AppImage.asset(
      path,
      color: color ?? this.color,
      width: width,
      height: height,
      size: size,
      alignment: alignment,
      fit: fit,
      colorFilter: colorFilter,
      failedBuilder: failedBuilder,
      loadingBuilder: loadingBuilder,
      key: key,
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      color: Colors.grey.shade200,
      child: Center(
        child: Icon(
          Icons.image_outlined,
          size: 40,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}
