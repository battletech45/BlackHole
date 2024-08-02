import 'package:black_hole/core/constant/colors.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageURL;
  final bool isSelected;
  final void Function() onTap;

  CategoryCard({super.key, required this.isSelected, required this.imageURL, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        padding: AppUI.horizontal / 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: isSelected ? AppColor.selectedBorderColor : AppColor.borderColor
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: AppUI.pageVerticalPadding / 4,
              child: Image.asset(imageURL),
            ),
            AppUI.horizontalGap(0.1),
            Text(title, style: AppTextStyle.smallButtonText.copyWith(color: isSelected ? AppColor.selectedBorderColor : AppColor.white))
          ],
        ),
      ),
    );
  }
}