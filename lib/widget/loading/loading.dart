import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/constant/colors.dart';

class LoadingWidget extends StatelessWidget {
  final double? size;
  final Color? color;
  final String? text;
  const LoadingWidget({super.key, this.size, this.color, this.text});

  @override
  Widget build(BuildContext context) {
    if (text != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoadingAnimationWidget.threeRotatingDots(color: color ?? AppColor.white, size: size ?? 48),
          Text(
            text!,
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else {
      return LoadingAnimationWidget.threeRotatingDots(color: color ?? AppColor.white, size: size ?? 48);
    }
  }
}
