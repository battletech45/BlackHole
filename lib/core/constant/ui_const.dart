import 'package:black_hole/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../service/log.dart';
import 'colors.dart';

class AppUI {
  const AppUI._();

  static bool didInit = false;
  static late Size screenSize;
  static late EdgeInsets safeArea;

  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration pageTransitionDuration = Duration(milliseconds: 400);

  static const double paddingValue = 20;

  static const double radiusValue = 20;
  static const horizontal = EdgeInsets.symmetric(horizontal: paddingValue);
  static Radius radius = const Radius.circular(radiusValue).r;
  static BorderRadius cardBorderRadius = BorderRadius.circular(radiusValue).r;
  static RoundedRectangleBorder rectangleBorder = RoundedRectangleBorder(borderRadius: cardBorderRadius);

  static SizedBox verticalBlankSpace = 21.vb;
  static SizedBox horizontalBlankSpace = 12.hb;

  static BoxDecoration borderedBoxDecoration = BoxDecoration(
    color: AppColor.backgroundLight,
    borderRadius: AppUI.cardBorderRadius,
    border: Border.all(color: AppColor.borderColor, style: BorderStyle.solid),
  );

  static BoxDecoration boxDecoration = BoxDecoration(color: AppColor.backgroundLight, borderRadius: AppUI.cardBorderRadius);

  /// ([paddingValue] = 12.0) * [multipler]
  static SizedBox horizontalGap([double multipler = 1]) => SizedBox(width: paddingValue * multipler);

  /// ([paddingValue] = 12.0) * [multipler]
  static SizedBox verticalGap([double multipler = 1]) => SizedBox(height: paddingValue * multipler);

  static SizedBox get zeroGap => const SizedBox.shrink();

  static EdgeInsets productCardPadding = const EdgeInsets.symmetric(horizontal: 12).r;
  static EdgeInsets pagePadding = const EdgeInsets.symmetric(horizontal: paddingValue).r;
  static EdgeInsets pageVerticalPadding = EdgeInsets.symmetric(vertical: paddingValue).r;
  static EdgeInsets pageFullSidePadding = const EdgeInsets.all(paddingValue).r;
  static EdgeInsets inputTopMargin = const EdgeInsets.only(top: 5).r;
  static EdgeInsets onboardBottomPadding = const EdgeInsets.only(left: paddingValue / 2, right: paddingValue / 2, bottom: paddingValue / 2).r;
  static EdgeInsets pageScrollPadding(BuildContext context) => EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + paddingValue).r;

  static EdgeInsets pageFullPadding(BuildContext context) =>
      EdgeInsets.only(left: paddingValue, right: paddingValue, top: paddingValue, bottom: MediaQuery.of(context).padding.bottom + paddingValue).r;

  static void init(BuildContext context) {
    if (didInit) return;
    screenSize = MediaQuery.of(context).size;
    safeArea = MediaQuery.of(context).padding;
    didInit = true;
    LoggerService.logInfo('AppUI init: SCREEN SIZE: $screenSize');
  }
}
