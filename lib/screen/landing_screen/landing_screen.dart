import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/model/screen.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:flutter/cupertino.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/navigation.dart';
import '../../core/constant/ui_const.dart';
import '../../core/util/circle.dart';
import '../../widget/loading/loading.dart';
import '../home_screen/home_screen.dart';

class LandingScreen extends StatefulWidget implements AppScreen {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();

  @override
  ScreenName get name => ScreenName.landing;
}

class _LandingScreenState extends State<LandingScreen> with SingleTickerProviderStateMixin {
  late AnimationController fadeCont;
  @override
  void initState() {
    fadeCont = AnimationController(vsync: this, duration: AppUI.animationDuration);
    appInit();
    super.initState();
  }

  @override
  void dispose() {
    fadeCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: false,
      child: Column(
        children: <Widget>[
          Expanded(
              child: Center(
                child: Image.asset(AppAsset.appLogo),
              )
          ),
          const LoadingWidget(color: AppColor.white, size: 50),
        ],
      ),
    );
  }

  Future<void> appInit() async {
    final screen = HomeScreen();
    AppNavigation.state.pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (context, _, __) => screen,
        settings: RouteSettings(name: ScreenName.home.name),
        transitionDuration: AppUI.pageTransitionDuration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var screenSize = MediaQuery.of(context).size;
          double beginRadius = 0.0;
          double endRadius = screenSize.longestSide * 1.2;
          var radiusTween = Tween(begin: beginRadius, end: endRadius);
          var radiusTweenAnim = radiusTween.animate(CurvedAnimation(parent: animation, curve: Curves.easeInQuart));
          animation.addStatusListener((status) {
            if (status == AnimationStatus.forward && fadeCont.status == AnimationStatus.dismissed) {
              fadeCont.forward();
            }
          });
          return ClipPath(
            clipper: CircleTransitionClipper(
              center: Offset(screenSize.width / 2, screenSize.height / 2),
              radius: radiusTweenAnim.value
            ),
            child: child,
          );
        }
      ),
        (route) => false,
    );
  }
}