import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/service/log.dart';
import 'package:black_hole/core/service/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/constant/colors.dart';
import '../../core/service/device_service.dart';
import '../../widget/loading/loading.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    try {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) {
        Future.delayed(Duration(seconds: 1), () {
          bool selectPath = context.read<AutherProvider>().showOnboard;
          if(selectPath) {
            context.go('/onboard');
          }
          else {
            context.go('/');
          }
        });
      });
    }
    catch(e) {
      LoggerService.logError(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if(DeviceService.isInit == false) {
      DeviceService.init(context);
    }
    return Scaffold(
      extendBody: true,
      body: Container(
        color: AppColor.black,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(AppAsset.appLogo, width: 200.w, height: 200.h, fit: BoxFit.cover),
            ),
            const LoadingWidget(color: AppColor.white, size: 50),
          ],
        ),
      ),
    );
  }
}