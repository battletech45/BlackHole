import 'package:black_hole/core/constant/text_style.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/ui_const.dart';

class ProfileCard extends StatelessWidget {
  final int totalPoint;

  const ProfileCard({super.key, required this.totalPoint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppUI.pageFullSidePadding,
      decoration: BoxDecoration(
          color: AppColor.cardBGDark,
          borderRadius: BorderRadius.circular(15.r)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              DashedCircularProgressBar(
                height: 60.h,
                width: 100.w,
                progress: totalPoint.toDouble(),
                startAngle: 270,
                sweepAngle: 180,
                circleCenterAlignment: Alignment.bottomCenter,
                foregroundColor: AppColor.buttonText,
                backgroundColor: AppColor.iconColor,
                foregroundStrokeWidth: 3,
                backgroundStrokeWidth: 2,
                backgroundGapSize: 5,
                backgroundDashSize: 1,
                seekColor: AppColor.buttonBG,
                seekSize: 17.r,
                animation: true,
              ),
              DashedCircularProgressBar(
                height: 60.h,
                width: 100.w,
                progress: (totalPoint / 10).truncate().toDouble(),
                startAngle: 270,
                sweepAngle: 180,
                circleCenterAlignment: Alignment.bottomCenter,
                foregroundColor: AppColor.buttonText,
                backgroundColor: AppColor.iconColor,
                foregroundStrokeWidth: 3,
                backgroundStrokeWidth: 2,
                backgroundGapSize: 5,
                backgroundDashSize: 1,
                seekColor: AppColor.buttonBG,
                seekSize: 17.r,
                animation: true,
              ),
            ],
          ),
          AppUI.verticalGap(0.75),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                  width: 140.w,
                  child: Text('Toplanan Puanlarınız', style: AppTextStyle.sizeText)
              ),
              SizedBox(
                  width: 140.w,
                  child: Text('Hediye Ürün Sayınız', style: AppTextStyle.sizeText)
              ),
            ],
          ),
          AppUI.verticalGap(0.75),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                  width: 140.w,
                  child: Text('$totalPoint', style: AppTextStyle.sizeText, textAlign: TextAlign.center)
              ),
              SizedBox(
                  width: 140.w,
                  child: Text('${(totalPoint / 10).truncate()}', style: AppTextStyle.sizeText, textAlign: TextAlign.center)
              ),
            ],
          ),
        ],
      ),
    );
  }
}