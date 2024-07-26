import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/widget/button/square_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors.dart';

class ProductTitleCard extends StatelessWidget {
  final String title;
  final String? extra;

  const ProductTitleCard({super.key, required this.title, this.extra});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.cardBGDark,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r)
      ),
      child: Padding(
        padding: AppUI.pageFullSidePadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: AppTextStyle.productTitle),
                AppUI.verticalGap(0.1),
                Visibility(
                  visible: extra != null,
                    child: Text('With $extra', style: AppTextStyle.productTitle.copyWith(color: AppColor.buttonText))
                ),
                AppUI.verticalGap(0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.star, color: AppColor.starColor),
                    AppUI.horizontalGap(0.4),
                    Text('4.5', style: AppTextStyle.ratingOverallText),
                    AppUI.horizontalGap(0.2),
                    Text('(6.236)', style: AppTextStyle.extraText)
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SquareButton(backgroundColor: AppColor.borderColor.withOpacity(0.5), icon: Icons.remove, iconColor: AppColor.white,paddingScale: 2, onTap: () {}),
                AppUI.horizontalGap(0.5),
                Text('5', style: AppTextStyle.ratingOverallText),
                AppUI.horizontalGap(0.5),
                SquareButton(backgroundColor: AppColor.borderColor.withOpacity(0.5), icon: Icons.add, iconColor: AppColor.white,paddingScale: 2, onTap: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}