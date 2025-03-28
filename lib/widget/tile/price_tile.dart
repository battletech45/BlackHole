import 'package:black_hole/core/constant/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/ui_const.dart';

class PriceTile extends StatelessWidget {
  final String price;

  const PriceTile({super.key, required this.price});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Price', style: AppTextStyle.bigButtonText.copyWith(color: AppColor.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(price, style: AppTextStyle.bigButtonText.copyWith(color: AppColor.white)),
                AppUI.horizontalGap(0.2),
                Text('₺', style: TextStyle(color: AppColor.buttonBG, fontSize: 16.sp))
              ],
            ),
          ],
        ),
        Container(
          padding: (AppUI.pageFullSidePadding / 2) + (AppUI.pagePadding / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColor.buttonBG
          ),
          child: Center(
            child: Text('Sepete Ekle', style: AppTextStyle.buttonTextStyle),
          ),
        )
      ],
    );
  }
}