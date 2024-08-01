import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:flutter/material.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/ui_const.dart';

class OnboardingPageScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String desc;

  const OnboardingPageScreen({super.key, required this.imagePath, required this.title, required this.desc});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: true,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: AppUI.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath, fit: BoxFit.cover),
            AppUI.verticalGap(),
            Text(title, style: AppTextStyle.authTitle.copyWith(color: AppColor.buttonText), textAlign: TextAlign.center),
            AppUI.verticalGap(),
            Text(desc, style: AppTextStyle.addressText.copyWith(color: AppColor.onboardText), textAlign: TextAlign.center),
            AppUI.verticalGap(),
          ],
        ),
      ),
    );
  }
}