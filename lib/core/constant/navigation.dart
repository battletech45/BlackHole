import 'package:black_hole/core/model/campaign.dart';
import 'package:black_hole/core/model/menu.dart';
import 'package:black_hole/screen/auth_screen/login_screen.dart';
import 'package:black_hole/screen/auth_screen/profile_screen.dart';
import 'package:black_hole/screen/auth_screen/register_screen.dart';
import 'package:black_hole/screen/campaign_screen/add_campaign_screen.dart';
import 'package:black_hole/screen/campaign_screen/campaign_detail_screen.dart';
import 'package:black_hole/screen/favorite_screen/favorite_screen.dart';
import 'package:black_hole/screen/home_screen/home_screen.dart';
import 'package:black_hole/screen/landing_screen/landing_screen.dart';
import 'package:black_hole/screen/onboarding_screen/onboarding_screen.dart';
import 'package:black_hole/screen/product_screen/product_detail_screen.dart';
import 'package:black_hole/screen/qr_screen/free_product_screen.dart';
import 'package:black_hole/screen/qr_screen/qr_reader_screen.dart';
import 'package:black_hole/screen/qr_screen/qr_screen.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/loading/loading.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screen/campaign_screen/campaign_screen.dart';
import '../../screen/product_screen/add_product_screen.dart';
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
          path: '/onboard',
          parentNavigatorKey: rootKey,
          name: 'Tanıtım Sayfası',
          builder: (context, state) => const OnboardingScreen()
        ),
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
            path: '/qrGenerate',
            parentNavigatorKey: rootKey,
            name: 'QR Oluşturma Sayfası',
            builder: (context, state) => const QrScreen()
        ),
        // --------------------------------
        //          ADMİN ROUTES START
        // --------------------------------
        GoRoute(
          path: '/qrRead',
          parentNavigatorKey: rootKey,
          name: 'QR sayfası',
          builder: (context, state) => const QrReaderScreen()
        ),
        GoRoute(
          path: '/qrFree',
          parentNavigatorKey: rootKey,
          name: 'QR Hediye Ürün Sayfası',
          builder: (context, state) => const FreeProductScreen()
        ),
        GoRoute(
          path: '/addProduct',
          parentNavigatorKey: rootKey,
          name: 'Ürün Giriş Sayfası',
          builder: (context, state) => const AddProductScreen()
        ),
        GoRoute(
          path: '/addNews',
          parentNavigatorKey: rootKey,
          name: 'Haber Giriş Sayfası',
          builder: (context, state) => const AddCampaignScreen()
        ),
        // --------------------------------
        //          ADMİN ROUTES END
        // --------------------------------
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
                    path: '/campaign',
                    name: 'Kampanya Sayfası',
                    builder: (context, state) => const CampaignScreen(),
                    routes: [
                      GoRoute(
                        path: ':id',
                        name: 'Kampanya Detay Sayfası',
                        builder: (context, state) => CampaignDetailScreen(model: state.extra as CampaignModel)
                      ),
                    ]
                  ),
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