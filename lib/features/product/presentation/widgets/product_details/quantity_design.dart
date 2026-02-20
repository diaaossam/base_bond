import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class QuantityDesign extends StatefulWidget {
  final bool isActive;
  final int count;
  final num? stock;
  final Function(Map<String, dynamic>) callback;
  final bool isCart;

  const QuantityDesign({
    super.key,
    this.count = 1,
    this.stock,
    required this.callback,
    this.isActive = true,
    required this.isCart,
  });

  @override
  State<QuantityDesign> createState() => _QuantityDesignState();
}

class _QuantityDesignState extends State<QuantityDesign> {
  int count = 1;

  @override
  void initState() {
    super.initState();
    count = widget.count;
  }

  @override
  void didUpdateWidget(covariant QuantityDesign oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.count != widget.count) {
      setState(() => count = widget.count);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isCart) {
      return Container(
        decoration: BoxDecoration(
          color: context.colorScheme.onTertiaryFixed,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() => count--);
                widget.callback({"isIncrease": false, "count": count});
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: context.colorScheme.outline),
                ),
                padding: const EdgeInsetsDirectional.all(10),
                child: SvgPicture.asset(
                  count == 1 && widget.isCart
                      ? Assets.icons.trash
                      : Assets.icons.minus,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppText(
                text: "$count",
                textSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (widget.stock == null) {
                  setState(() => count++);
                  widget.callback({"isIncrease": true, "count": count});
                } else {
                  if (count < widget.stock!) {
                    setState(() => count++);
                    widget.callback({"isIncrease": true, "count": count});
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: widget.isActive
                      ? context.colorScheme.primary
                      : context.colorScheme.onPrimaryFixed,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsetsDirectional.all(10),
                child: SvgPicture.asset(Assets.icons.add),
              ),
            ),
          ],
        ),
      );
    } else {
      return IgnorePointer(
        ignoring: !widget.isActive,
        child: Container(
          margin: EdgeInsetsGeometry.only(bottom: 20, top: 5),
          decoration: BoxDecoration(
            color: context.colorScheme.onTertiaryFixed,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() => count--);
                  widget.callback({"isIncrease": false, "count": count});
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: context.colorScheme.primary),
                  ),
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 15,
                    vertical: 7,
                  ),
                  child: AppImage.asset(
                    count == 1 && widget.isCart
                        ? Assets.icons.trash
                        : Assets.icons.minus,
                    size: 30,
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
              30.horizontalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AppText(
                  text: "$count",
                  textSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              30.horizontalSpace,
              GestureDetector(
                onTap: () {
                  if (widget.stock == null) {
                    setState(() => count++);
                    widget.callback({"isIncrease": true, "count": count});
                  } else {
                    if (count < widget.stock!) {
                      setState(() => count++);
                      widget.callback({"isIncrease": true, "count": count});
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: context.colorScheme.primary),

                    color: context.colorScheme.primary,
                  ),
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 15,
                    vertical: 7,
                  ),
                  child: AppImage.asset(Assets.icons.add, size: 30),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
