import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/service/provider/theme.dart';
import 'package:black_hole/firebase_options.dart';
import 'package:black_hole/screen/landing_screen/landing_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constant/navigation.dart';

late String themeStr;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent, systemStatusBarContrastEnforced: true));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Future.delayed(const Duration(seconds: 1));
  runApp(BlackHoleApp());
}

class BlackHoleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppUI.init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(themeString: themeStr))
      ],
      builder: (context, __) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, __) {
            context.read<ThemeProvider>().init(context);
            return MaterialApp(
              navigatorKey: AppNavigation.navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: context.watch<ThemeProvider>().selected,
              navigatorObservers: [AppNavigatorObserver()],
              home: const LandingScreen(),
              builder: (context, child) {
                return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
                    child: child!,
                );
              },
            );
          },
        );
      },
    );
  }
}

Future<void> providerInit() async {
  themeStr = await checkSharedForTheme();
}

Future<String> checkSharedForTheme() async {
  final shared = await SharedPreferences.getInstance();

  if (shared.containsKey('theme')) {
    return shared.getString('theme')!;
  } else {
    return 'platform';
  }
}