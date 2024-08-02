import 'package:black_hole/core/constant/colors.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/navigation_transition.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Montserrat',
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(primary: AppColor.backgroundLight, secondary: AppColor.cardBGLight),
    appBarTheme: const AppBarTheme(iconTheme: _iconTheme, backgroundColor: AppColor.backgroundLight),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: AppColor.backgroundLight, unselectedItemColor: AppColor.cardBGLight),
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: SlidingPageTransition(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        }
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColor.red),
    indicatorColor: AppColor.buttonBG,
    inputDecorationTheme: _inputTheme,
    filledButtonTheme: filledButtonTheme,
    textButtonTheme: _textButtonTheme,
    cardTheme: _cardTheme,
    bottomSheetTheme: _bottomSheetTheme,
    dialogTheme: dialogTheme,
    datePickerTheme: _datePickerTheme,
    checkboxTheme: _checkboxThemeData,
    dividerTheme: _dividerThemeData,
    snackBarTheme: _snackBarThemeData,
    iconTheme: _iconTheme,
  );

  static ThemeData darkTheme = ThemeData(
      fontFamily: 'Montserrat',
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(primary: AppColor.backgroundDark, secondary: AppColor.cardBGDark),
      appBarTheme: const AppBarTheme(iconTheme: _iconTheme, backgroundColor: AppColor.backgroundDark),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: AppColor.backgroundDark, unselectedItemColor: AppColor.cardBGDark),
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: SlidingPageTransition(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
          }
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColor.red),
      indicatorColor: AppColor.buttonBG,
      inputDecorationTheme: _inputThemeDark,
      filledButtonTheme: filledButtonTheme,
      textButtonTheme: _textButtonThemeDark,
      cardTheme: _cardThemeDark,
      bottomSheetTheme: _bottomSheetTheme,
      dialogTheme: dialogTheme,
      datePickerTheme: _datePickerTheme,
      checkboxTheme: _checkboxThemeData,
      dividerTheme: _dividerThemeData,
      snackBarTheme: _snackBarThemeDataDark,
      iconTheme: _iconTheme
  );

  static const IconThemeData _iconTheme = IconThemeData(size: 20, color: AppColor.iconColor);
  static const DividerThemeData _dividerThemeData = DividerThemeData(space: 0, color: AppColor.iconColor);
  static const CheckboxThemeData _checkboxThemeData = CheckboxThemeData(shape: CircleBorder());
  static const _datePickerTheme = DatePickerThemeData(surfaceTintColor: Colors.transparent);

  static final BottomSheetThemeData _bottomSheetTheme = BottomSheetThemeData(
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: const BorderRadius.vertical(top: Radius.circular(AppUI.radiusValue)).r),
    showDragHandle: true,
  );

  static DialogTheme dialogTheme = DialogTheme(
    shape: AppUI.rectangleBorder,
    surfaceTintColor: Colors.transparent,
  );

  static final _inputTheme = InputDecorationTheme(
    alignLabelWithHint: true,
    enabledBorder: _enabledBorder,
    focusedBorder: _focusedBorder,
    errorBorder: errorBorder,
    filled: true,
    fillColor: AppColor.backgroundLight,
    focusedErrorBorder: focusedErrorBorder,
    helperMaxLines: 1,
    errorMaxLines: 1,
    errorStyle: AppTextStyle.fieldError,
    hintStyle: AppTextStyle.fieldHint,
  );

  static final _inputThemeDark = InputDecorationTheme(
    alignLabelWithHint: true,
    enabledBorder: _enabledBorderDark,
    focusedBorder: _focusedBorderDark,
    errorBorder: errorBorder,
    filled: true,
    fillColor: AppColor.backgroundDark,
    focusedErrorBorder: focusedErrorBorder,
    helperMaxLines: 1,
    errorMaxLines: 1,
    errorStyle: AppTextStyle.fieldError,
    hintStyle: AppTextStyle.fieldHint,
  );

  static final _cardTheme = CardTheme(
    surfaceTintColor: Colors.transparent,
    color: AppColor.cardBGLight,
    shape: AppUI.rectangleBorder.copyWith(side: const BorderSide(color: AppColor.borderColor, width: 1, style: BorderStyle.solid)),
    margin: EdgeInsets.zero,
    elevation: 0,
  );

  static final _cardThemeDark = CardTheme(
    surfaceTintColor: Colors.transparent,
    color: AppColor.cardBGDark,
    shape: AppUI.rectangleBorder,
    margin: EdgeInsets.zero,
    elevation: 0,
  );

  static final _snackBarThemeData = SnackBarThemeData(
    shape: AppUI.rectangleBorder,
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    backgroundColor: AppColor.cardBGLight,
  );

  static final _snackBarThemeDataDark = SnackBarThemeData(
    shape: AppUI.rectangleBorder,
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    backgroundColor: AppColor.cardBGDark,
  );

  static const _border = BorderSide(color: AppColor.borderColor);
  static const _borderDark = BorderSide(color: AppColor.selectedBorderColor);

  static final _enabledBorder = OutlineInputBorder(
    borderRadius: AppUI.cardBorderRadius,
    borderSide: _border,
  );

  static final _enabledBorderDark = OutlineInputBorder(
    borderRadius: AppUI.cardBorderRadius,
    borderSide: _borderDark,
  );

  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: AppUI.cardBorderRadius,
    borderSide: const BorderSide(width: 1.5, color: AppColor.red),
  );

  static OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderRadius: AppUI.cardBorderRadius,
    borderSide: const BorderSide(width: 2, color: AppColor.red),
  );

  static final _focusedBorder = OutlineInputBorder(
    borderRadius: AppUI.cardBorderRadius,
    borderSide: const BorderSide(width: 2, color: AppColor.borderColor),
  );

  static final _focusedBorderDark = OutlineInputBorder(
    borderRadius: AppUI.cardBorderRadius,
    borderSide: const BorderSide(width: 2, color: AppColor.selectedBorderColor),
  );

  static FilledButtonThemeData filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      foregroundColor: AppColor.cardBGDark,
      shape: AppUI.rectangleBorder,
      textStyle: AppTextStyle.bigButtonText,
    ),
  );
  static final _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColor.cardBGDark,
      shape: AppUI.rectangleBorder,
      textStyle: AppTextStyle.smallButtonText,
    ),
  );

  static final _textButtonThemeDark = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColor.cardBGDark,
      shape: AppUI.rectangleBorder,
      textStyle: AppTextStyle.smallButtonText,
    ),
  );
}