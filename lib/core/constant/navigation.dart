import 'package:black_hole/core/model/menu.dart';
import 'package:black_hole/screen/auth_screen/login_screen.dart';
import 'package:black_hole/screen/auth_screen/profile_screen.dart';
import 'package:black_hole/screen/auth_screen/register_screen.dart';
import 'package:black_hole/screen/cart_screen/cart_screen.dart';
import 'package:black_hole/screen/favorite_screen/favorite_screen.dart';
import 'package:black_hole/screen/home_screen/home_screen.dart';
import 'package:black_hole/screen/landing_screen/landing_screen.dart';
import 'package:black_hole/screen/product_screen/product_detail_screen.dart';
import 'package:black_hole/screen/qr_screen/qr_screen.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/loading/loading.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../widget/base/bottom_navbar.dart';
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
        GoRoute(
          path: '/product_detail',
          parentNavigatorKey: rootKey,
          name: 'Ürün Detay Sayfası',
          builder: (context, state) => ProductDetailScreen(model: state.extra as MenuItemModel)
        ),
        GoRoute(
          path: '/qr',
          parentNavigatorKey: rootKey,
          name: 'QR sayfası',
          builder: (context, state) => QrScreen()
        ),
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: rootKey,
          builder: (context, state, navigationShell) {
            return AppScaffold(
              backgroundImage: true,
              backgroundColor: AppColor.black,
              bottomNavigationBar: AppBottomNavBar(
                currentIndex: navigationShell.currentIndex,
                onTap: (index) => navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
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
            StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/cart',
                    name: 'Sepet Sayfası',
                    builder: (context, state) => const CartScreen()
                  )
                ]
            ),
            StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/favorite',
                    name: 'Favoriler Sayfası',
                    builder: (context, state) => FavoriteScreen()
                  )
                ]
            ),
            StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/profile',
                    name: 'Profil Sayfası',
                    builder: (context, state) => const ProfileScreen()
                  )
                ]
            ),
          ]
        )
      ]
  );
}