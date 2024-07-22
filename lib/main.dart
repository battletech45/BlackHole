import 'package:black_hole/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart' as intl;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'core/constant/navigation.dart';

late AuthProvider authProvider;
const appLocale = Locale('tr', 'TR');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent, systemStatusBarContrastEnforced: true));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Intl.defaultLocale = 'tr_TR';
  intl.initializeDateFormatting('tr_TR', '');
  await Future.delayed(const Duration(seconds: 1));
  runApp(BlackHoleApp());
}

class BlackHoleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      builder: (context, __) {
        return ScreenUtilInit(
          designSize: const Size(393, 808),
          builder: (context, __) {
            return MaterialApp(
              navigatorKey: AppNavigation.navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: context.watch<ThemeProvider>().selected,
              navigatorObservers: [AppNavigatorObserver()],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: const [appLocale],
              locale: appLocale,
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