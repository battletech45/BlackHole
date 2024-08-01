import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/constant/colors.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/service/provider/auth.dart';
import 'package:black_hole/screen/onboarding_screen/onboarding_page_screen.dart';
import 'package:black_hole/widget/button/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding/onboarding.dart';
import 'package:provider/provider.dart';

import '../../widget/base/scaffold.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late int index;
  final activePainter = Paint();
  final inactivePainter = Paint();
  List<Widget> pages = [
    OnboardingPageScreen(imagePath: AppAsset.firstOnboard, title: 'Old fashioned coffee that tastes very good and great', desc: 'We provide a variety of coffee grounds that are old-fashioned and also maintained.'),
    OnboardingPageScreen(imagePath: AppAsset.firstOnboard, title: 'Coffee plus special snack with affordable price', desc: 'Buy at a very affordable price and directly delivered to your home.'),
    OnboardingPageScreen(imagePath: AppAsset.firstOnboard, title: 'Mixing very professional touch compared to others', desc: 'We are very professional at marking a coffee for you'),
  ];

  @override
  void initState() {
    super.initState();
    index = 0;
    activePainter.color = AppColor.buttonBG;
    activePainter.strokeWidth = 1;
    activePainter.strokeCap = StrokeCap.round;
    activePainter.style = PaintingStyle.fill;

    inactivePainter.color = AppColor.cardBGDark;
    inactivePainter.strokeWidth = 1;
    inactivePainter.strokeCap = StrokeCap.round;
    inactivePainter.style = PaintingStyle.stroke;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: true,
      child: SafeArea(
        child: Onboarding(
          swipeableBody: pages,
          startIndex: 0,
          onPageChanges: (_, __, currentIndex, sd) {
            index = currentIndex;
          },
          buildFooter: (context, dragDistance, pagesLength, currentIndex, setIndex, sd) {
            return Padding(
              padding: AppUI.onboardBottomPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: AppUI.pagePadding,
                      alignment: Alignment.centerLeft,
                      child: Indicator<CirclePainter>(
                        painter: CirclePainter(
                          currentPageIndex: currentIndex,
                          pagesLength: pagesLength,
                          netDragPercent: dragDistance,
                          activePainter: activePainter,
                          inactivePainter: inactivePainter,
                          slideDirection: sd,
                          radius: 5.r,
                          space: 10.r,
                          showAllActiveIndicators: false
                        ),
                      ),
                    ),
                  ),
                  LoadingButton(
                    backgroundColor: AppColor.buttonBG,
                    onTap: () async {
                      if(index == pagesLength - 1) {
                        await context.read<AutherProvider>().writeOnboardShared(false);
                        context.go('/');
                      }
                      else {
                        setState(() {
                          index = index + 1;
                        });
                        setIndex(index);
                      }
                    },
                    child: Text(index != pagesLength - 1 ? 'Sonraki' : 'Başla', style: AppTextStyle.smallButtonText.copyWith(color: AppColor.buttonText)),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}