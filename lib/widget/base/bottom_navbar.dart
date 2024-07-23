import 'package:black_hole/core/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constant/colors.dart';
import '../../core/service/device_service.dart';

class AppBottomNavBar extends StatelessWidget {
  final void Function(int index)? onTap;
  final int currentIndex;
  const AppBottomNavBar({super.key, this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      selectedItemColor: AppColor.buttonBG,
      unselectedItemColor: AppColor.white,
      backgroundColor: AppColor.black,
      selectedLabelStyle: TextStyle(fontSize: DeviceService.isTablet ? 16 : 12.sp),
      unselectedLabelStyle: TextStyle(fontSize: DeviceService.isTablet ? 14 : 10.sp),
      type: BottomNavigationBarType.fixed,
      iconSize: DeviceService.isTablet ? 24 : 21.sp,
      items: [
        BottomNavigationBarItem(icon: SvgPicture.asset(AppAsset.homeIcon), label: 'Ana Menü'),
        BottomNavigationBarItem(icon: SvgPicture.asset(AppAsset.bagIcon), label: 'Sepet'),
        BottomNavigationBarItem(icon: SvgPicture.asset(AppAsset.heartIcon), label: 'Favoriler'),
        BottomNavigationBarItem(icon: SvgPicture.asset(AppAsset.notificationIcon), label: 'Hesabım'),
      ],
    );
  }
}