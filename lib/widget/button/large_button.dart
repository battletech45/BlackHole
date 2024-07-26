import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LargeButton extends StatelessWidget {
  final Color backgroundColor;
  final String buttonText;

  const LargeButton({super.key, required this.backgroundColor, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppUI.pagePadding + (AppUI.pageVerticalPadding / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: backgroundColor
      ),
      child: Text(buttonText, style: AppTextStyle.buttonTextStyle),
    );
  }
}