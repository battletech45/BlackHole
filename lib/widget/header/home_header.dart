import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/service/provider/auth.dart';
import 'package:black_hole/widget/form/app_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../core/constant/colors.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Hello, ${context.watch<AutherProvider>().user?.displayName ?? 'Coffee Bean'}', style: AppTextStyle.homeHeader),
            Container(
              padding: AppUI.pagePadding / 4,
              decoration: BoxDecoration(
                  color: AppColor.cardBGDark,
                  borderRadius: BorderRadius.circular(25.r)
              ),
              child: Icon(Icons.search, color: AppColor.white),
            )
          ],
        ),
        AppUI.verticalBlankSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.location_on),
            AppUI.horizontalBlankSpace,
            Text('You are always at Black Hole ☕')
          ],
        ),
        Container(
          padding: AppUI.pagePadding / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r)
          ),
          child: AppFormField(
            hintText: 'Search here...',
            prefixIcon: Icon(Icons.search, color: AppColor.white),
          ),
        ),
        AppUI.verticalBlankSpace
      ],
    );
  }
}