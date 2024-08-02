import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle homeHeader = TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w800);
  static TextStyle authTitle = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800);
  static TextStyle ratingOverallText = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600);
  static TextStyle authText = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColor.onboardText);
  static TextStyle registerText = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600);
  static TextStyle extraText = TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500);
  static TextStyle addressText = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle buttonTextStyle = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppColor.buttonText);
  static TextStyle productTitle = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700);

  static TextStyle bigButtonText = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600);
  static TextStyle smallButtonText = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle fieldHint = TextStyle(fontSize: 11.sp, color: AppColor.iconColor);
  static TextStyle fieldError = TextStyle(fontSize: 11.sp);
  static TextStyle sizeText = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500);
}