import 'package:black_hole/core/constant/ui_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        color: AppColor.buttonBG
      ),
      child: Center(child: Icon(Icons.add, color: AppColor.white)),
    );
  }
}