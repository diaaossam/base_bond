import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';

class LikeButtonDesign extends StatelessWidget {
  final Function(bool) onTapped;
  final bool isLiked;
  final double? size;
  final double? padding;
  final bool showBorder;

  const LikeButtonDesign({
    super.key,
    required this.onTapped,
    required this.isLiked,
    this.size,
    this.padding,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: size ?? 35,
      onTap: _onTapped,
      isLiked: isLiked,
      circleColor: const CircleColor(start: Colors.red, end: Colors.red),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Colors.red,
        dotSecondaryColor: Colors.black,
      ),
      likeBuilder: (bool isLiked) {
        return Container(
          padding: EdgeInsets.all(padding ?? 5),
          decoration: BoxDecoration(
            border: showBorder
                ? Border.all(color: context.colorScheme.outline)
                : null,
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: AppImage.asset(
            isLiked ? Assets.icons.heart2 : Assets.icons.heart,
          ),
        );
      },
    );
  }

  Future<bool?> _onTapped(bool isLiked) async {
    onTapped(!isLiked);
    return !isLiked;
  }
}
