import 'package:black_hole/core/constant/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/text_style.dart';

class IngredientTile extends StatelessWidget {
  final String title;

  const IngredientTile({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColor.cardBGDark
            ),
            padding: AppUI.pageFullSidePadding / 4,
            child: Icon(Icons.check, color: AppColor.buttonText),
          ),
          AppUI.horizontalGap(0.2),
          Text(title, style: AppTextStyle.productTitle.copyWith(color: AppColor.white))
        ],
      ),
    );
  }
}