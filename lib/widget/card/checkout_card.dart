import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/widget/divider/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/ui_const.dart';

class CheckoutCard extends StatelessWidget {
  final String price;
  final String? discount;

  const CheckoutCard({super.key, required this.price, this.discount});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Items', style: AppTextStyle.addressText),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(price, style: AppTextStyle.bigButtonText.copyWith(color: AppColor.borderColor)),
                  AppUI.horizontalGap(0.2),
                  Text('₺', style: TextStyle(color: AppColor.borderColor, fontSize: 16.sp))
                ],
              ),
            ],
          ),
          Visibility(
            visible: discount != null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Discounts', style: AppTextStyle.addressText),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('- $discount', style: AppTextStyle.bigButtonText.copyWith(color: AppColor.borderColor)),
                    AppUI.horizontalGap(0.2),
                    Text('₺', style: TextStyle(color: AppColor.borderColor, fontSize: 16.sp))
                  ],
                ),
              ],
            ),
          ),
          AppUI.verticalGap(0.5),
          Divider(),
          AppUI.verticalGap(0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Grand Total', style: AppTextStyle.productTitle),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(price, style: AppTextStyle.productTitle.copyWith(color: AppColor.buttonBG)),
                  AppUI.horizontalGap(0.2),
                  Text('₺', style: TextStyle(color: AppColor.buttonBG, fontSize: 16.sp))
                ],
              ),
            ],
          ),
          AppUI.verticalGap(0.5),
          Container(
            padding: (AppUI.pageFullSidePadding / 2) + (AppUI.pagePadding / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColor.buttonBG
            ),
            child: Center(
              child: Text('Satın Al', style: AppTextStyle.buttonTextStyle),
            ),
          )
        ],
      ),
    );
  }
}