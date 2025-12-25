import 'package:flutter/material.dart';
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
    _setUpCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.isActive,
      child: AnimatedContainer(
        duration: const Duration(seconds: 4),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: context.colorScheme.onTertiaryFixed,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                if (count == 1 && !widget.isCart) return;
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
      ),
    );
  }

  void _setUpCount() {
    setState(() => count = widget.count);
  }
}
