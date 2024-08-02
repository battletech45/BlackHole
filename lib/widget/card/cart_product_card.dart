import 'package:black_hole/core/constant/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/text_style.dart';
import '../button/square_button.dart';

class CartProductCard extends StatelessWidget {
  final String imageURL;
  final String title;
  final String size;
  final String price;
  final String? extra;

  const CartProductCard({super.key, required this.imageURL, required this.title, required this.size, this.extra, required this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppUI.pageVerticalPadding / 2,
      padding: AppUI.pageFullSidePadding / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColor.cardBGDark,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: AppUI.pageFullSidePadding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColor.backgroundDark
              ),
              child: Center(
                  child: Image.asset(imageURL, width: 70.w, height: 70.h, fit: BoxFit.cover)
              )
          ),
          AppUI.horizontalGap(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: AppTextStyle.registerText),
                AppUI.verticalGap(0.3),
                Text(size, style: AppTextStyle.extraText.copyWith(color: AppColor.borderColor)),
                AppUI.verticalGap(0.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(price, style: AppTextStyle.bigButtonText),
                        AppUI.horizontalGap(0.2),
                        Text('₺', style: TextStyle(color: AppColor.buttonBG, fontSize: 16.sp))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SquareButton(backgroundColor: AppColor.borderColor.withOpacity(0.5), icon: Icons.remove, iconColor: AppColor.white, paddingScale: 4,onTap: () {}),
                        AppUI.horizontalGap(0.5),
                        Text('5', style: AppTextStyle.ratingOverallText),
                        AppUI.horizontalGap(0.5),
                        SquareButton(backgroundColor: AppColor.borderColor.withOpacity(0.5), icon: Icons.add, iconColor: AppColor.white, paddingScale: 4, onTap: () {}),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}