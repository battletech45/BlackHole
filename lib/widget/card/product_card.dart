import 'dart:ui';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/widget/button/add_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors.dart';

class ProductCard extends StatelessWidget {
  final String imageURL;
  final String title;
  final String? extra;
  final String price;
  final bool isFavorited;
  const ProductCard({super.key, required this.imageURL, required this.title, this.extra, required this.price, required this.isFavorited});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.cardBGDark,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: AppUI.productCardPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: CachedNetworkImage(imageUrl: imageURL, width: 110.w, height: 110.h, fit: BoxFit.cover)
                  ),
                ]
              ),
            ),
            AppUI.verticalGap(0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title, style: AppTextStyle.bigButtonText),
                Container(
                  padding: AppUI.pageFullSidePadding / 3,
                  decoration: BoxDecoration(
                      color: AppColor.iconColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: isFavorited ? Icon(Icons.favorite, color: AppColor.buttonBG) : Icon(Icons.favorite_border, color: AppColor.white),
                )
              ],
            ),
            AppUI.verticalGap(0.2),
            Visibility(
              visible: extra != null,
                child: Text('With $extra', style: AppTextStyle.extraText.copyWith(color: AppColor.buttonText))
            ),
            AppUI.verticalGap(0.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(price, style: AppTextStyle.registerText),
                    AppUI.horizontalGap(0.2),
                    Text('₺', style: TextStyle(color: AppColor.buttonBG, fontSize: 15.sp))
                  ],
                ),
                AddButton(function: () {print('Add');})
              ],
            )
          ],
        ),
      ),
    );
  }
}