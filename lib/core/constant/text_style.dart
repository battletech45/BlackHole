import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle authTitle = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800);
  static TextStyle authText = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColor.onboardText);
  static TextStyle buttonTextStyle = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppColor.buttonText);

  static TextStyle bigButtonText = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600);
  static TextStyle smallButtonText = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle fieldHint = TextStyle(fontSize: 11.sp, color: AppColor.iconColor);
  static TextStyle fieldError = TextStyle(fontSize: 11.sp);
}