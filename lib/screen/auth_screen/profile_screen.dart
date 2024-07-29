import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/service/provider/auth.dart';
import 'package:black_hole/widget/tile/navigation_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/constant/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppUI.pagePadding / 2,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Profil', style: AppTextStyle.homeHeader),
              AppUI.verticalGap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: AppUI.pageFullSidePadding / 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(
                          color: AppColor.selectedBorderColor,
                          width: 1
                        )
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.r),
                          child: Image.asset(AppAsset.productTest, width: 70.w, height: 70.h, fit: BoxFit.cover)
                      )
                  ),
                  AppUI.horizontalGap(),
                  Text(context.watch<AutherProvider>().user?.displayName ?? 'Altay Taneri', style: AppTextStyle.homeHeader),
                ],
              ),
              AppUI.verticalGap(),
              Container(
                  padding: AppUI.pageFullSidePadding,
                  decoration: BoxDecoration(
                    color: AppColor.cardBGDark,
                    borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: NavigationTile(title: 'About Us')
              ),
              AppUI.verticalGap(),
              Container(
                  padding: AppUI.pageFullSidePadding,
                  decoration: BoxDecoration(
                    color: AppColor.cardBGDark,
                    borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: NavigationTile(title: 'About Us')
              ),
              AppUI.verticalGap(),
              Container(
                  padding: AppUI.pageFullSidePadding,
                  decoration: BoxDecoration(
                    color: AppColor.cardBGDark,
                    borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: NavigationTile(title: 'About Us')
              ),
              AppUI.verticalGap(),
              Container(
                  padding: AppUI.pageFullSidePadding,
                  decoration: BoxDecoration(
                    color: AppColor.cardBGDark,
                    borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: NavigationTile(title: 'About Us')
              ),
              AppUI.verticalGap(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.logout, color: AppColor.red),
                  AppUI.horizontalGap(0.2),
                  Text('Logout', style: AppTextStyle.bigButtonText.copyWith(color: AppColor.red))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}