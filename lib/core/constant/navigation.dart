import 'package:flutter/material.dart';
import '../model/screen.dart';
import '../service/log.dart';

enum ScreenName {
  landing('landing'),
  home('home'),
  cart('cart'),
  favorites('favorites'),
  profile('profile'),
  dialog('dialog'),
  bottomSheet('bottomSheet');

  final String name;
  const ScreenName(this.name);
}

class AppNavigation{
  const AppNavigation._();

  static var navigationList = <ScreenName>[ScreenName.landing];

  static var bottomNavBarNavigationList = <ScreenName>[ScreenName.home, ScreenName.cart, ScreenName.favorites, ScreenName.profile];

  static ScreenName get currentRouteName => navigationList.last;

  static final navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get state => navigatorKey.currentState!;

  static void pop<T extends Object?>({T? result, bool isSystemPop = false}) {
    if (navigationList.isEmpty) return;
    if (isSystemPop) {
      navigationList.removeLast();
    }
    if (!isSystemPop) {
      state.pop(result);
    }
    LogService.logLn('POP::: isSystem:$isSystemPop:::${AppNavigation.navigationList}');
  }

  static Future<T?> pushScreen<T>(AppScreen screen, {bool repeatable = false}) {
    if (screen.name == currentRouteName && !repeatable) pop();
    navigationList.add(screen.name);
    final Future<T?> t = state.push(MaterialPageRoute(builder: (context) => screen, settings: RouteSettings(name: screen.name.name)));
    LogService.logLn('PUSH:::${AppNavigation.navigationList}');
    return t;
  }

  static Future<T?> pushAndRemoveUntilScreen<T>(AppScreen screen, {bool repeatable = false, bool Function(Route<dynamic>)? predicate}) {
    if (screen.name == currentRouteName && !repeatable) pop();
    navigationList.clear();
    navigationList.add(screen.name);
    final Future<T?> t = state.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screen, settings: RouteSettings(name: screen.name.name)), predicate ?? (route) => false);
    LogService.logLn('PUSH AND REMOVE UNTİL:::${AppNavigation.navigationList}');
    return t;
  }

  static Future<T?> showModalBottomSheet<T>(
      AppBottomSheet bottomSheet, {
        bool isScrollControlled = false,
        bool enableDrag = true,
        bool isDismissible = true,
        bool showDragHandle = false,
        Color backgroundColor = Colors.transparent,
        bool repeatable = false,
      }) {
    if (ScreenName.bottomSheet == currentRouteName && !repeatable) pop(isSystemPop: true);
    navigationList.add(ScreenName.bottomSheet);
    LogService.logLn(navigationList.toString());
    final t = state
        .push<T>(
      ModalBottomSheetRoute(
        builder: (context) => bottomSheet,
        isScrollControlled: isScrollControlled,
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        showDragHandle: showDragHandle,
        backgroundColor: backgroundColor,
      ),
    )
        .whenComplete(() {
      pop(isSystemPop: true);
    });
    return t;
  }

  static Future<T?> showDialog<T>(
      BuildContext context,
      AppDialog dialog, {
        bool isScrollControlled = false,
        bool enableDrag = true,
        bool isDismissible = true,
        bool showDragHandle = false,
        Color backgroundColor = Colors.transparent,
        bool repeatable = false,
      }) {
    if (ScreenName.dialog == currentRouteName && !repeatable) pop(isSystemPop: true);
    navigationList.add(ScreenName.dialog);
    LogService.logLn(navigationList.toString());
    final t = state
        .push<T>(
      DialogRoute(
        context: context,
        builder: (context) => dialog,
      ),
    )
        .whenComplete(() {
      pop(isSystemPop: true);
    });
    return t;
  }
}

class AppNavigatorObserver extends NavigatorObserver {
  AppNavigatorObserver();

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      AppNavigation.pop(isSystemPop: true);
    }
    super.didPop(route, previousRoute);
  }
}
