import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();

  static const buttonBG = Color(0xffA9612F);
  static const buttonText = Color(0xffF0CEAB);
  static const hintTextColor = Color(0xff313131);
  static const onboardText = Color(0xff896E59);
  static const borderColor = Color(0xff919499);
  static const iconColor = Color(0xffC8C8C8);
  static const selectedBorderColor = Color(0xff9B6842);

  static const white = Color(0xffffffff);
  static const red = Color(0xffDC3545);
  static const black = Color(0xff000000);

  //! ----------------------------------------------------------------------------
  //!                                   DARK
  //! ----------------------------------------------------------------------------
  static const backgroundDark = Color(0xff0C0F14);
  static const titleDark = buttonText;
  static const cardBGDark = Color(0xff141921);
  static const searchBGDark = Color(0xff181A1E);
  static const searchTextDark = Color(0xff50555C);
  static const productBGDark = titleLight;
  static const productTitleBGDark = Color(0xff484747);
  static const quantityButtonBGDark = borderColor;

  //! ----------------------------------------------------------------------------
  //!                                   LIGHT
  //! ----------------------------------------------------------------------------
  static const backgroundLight = Color(0xffffffff);
  static const titleLight = Color(0xff552B1B);
  static const cardBGLight = Color(0xffF6F6F6);
  static const searchBGLight = Color(0xffF1F1F1);
  static const searchTextLight = searchTextDark;
  static const productBGLight = buttonText;
  static const productTitleBGLight = borderColor;
  static const quantityButtonBGLight = productBGLight;
}