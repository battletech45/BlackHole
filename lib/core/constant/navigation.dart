import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/screen/auth_screen/login_screen.dart';
import 'package:black_hole/screen/auth_screen/register_screen.dart';
import 'package:black_hole/screen/home_screen/home_screen.dart';
import 'package:black_hole/screen/landing_screen/landing_screen.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/loading/loading.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../widget/base/bottom_navbar.dart';
import 'assets.dart';
import 'colors.dart';

const rootKey = GlobalObjectKey<NavigatorState>('root');
const _mainShellKey = GlobalObjectKey<NavigatorState>('shell');

class AppRouterConfig {
  static final analytics = FirebaseAnalytics.instance;
  static final firebaseObserver = FirebaseAnalyticsObserver(analytics: analytics);

  static GoRouter router = GoRouter(
      navigatorKey: rootKey,
      initialLocation: '/landing_screen',
      redirect: (context, state) {
        if(state.error != null) {
          return '/';
        }
        else {
          return null;
        }
      },
      errorPageBuilder: (context, state) => NoTransitionPage(
          child: Scaffold(
            appBar: AppBar(),
            body: const SafeArea(
                child: PageError()
            ),
          )
      ),
      observers: [firebaseObserver],
      routes: [
        GoRoute(
          path: '/landing_screen',
          parentNavigatorKey: rootKey,
          name: 'Karşılama Sayfası',
          builder: (context, state) => const LandingScreen()
        ),
        GoRoute(
          path: '/login',
          parentNavigatorKey: rootKey,
          name: 'Giriş Sayfası',
          builder: (context, state) => const LoginScreen()
        ),
        GoRoute(
          path: '/register',
          parentNavigatorKey: rootKey,
          name: 'Kayıt Sayfası',
          builder: (context, state) => const RegisterScreen()
        ),
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: rootKey,
          builder: (context, state, navigationShell) {
            return AppScaffold(
              bottomNavigationBar: AppBottomNavBar(
                currentIndex: navigationShell.currentIndex,
              ),
              floatingActionButton: Container(
                decoration: BoxDecoration(
                  color: AppColor.buttonBG,
                  borderRadius: BorderRadius.circular(50.r)
                ),
                padding: EdgeInsets.all(5.r),
                child: IconButton(
                  color: AppColor.white,
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ),
              child: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
                navigatorKey: _mainShellKey,
                routes: [
                  GoRoute(
                      path: '/',
                      name: 'Ana Sayfa',
                      builder: (context, state) => const HomeScreen(),
                      routes: []
                  ),
                ]
            ),
          ]
        )
      ]
  );
}