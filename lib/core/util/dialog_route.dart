import 'package:flutter/material.dart';

class AppDialogRoute<T> extends PopupRoute<T> {
  AppDialogRoute({
    required this.builder,
    this.dismissible = true,
    super.settings,
  });

  final WidgetBuilder builder;
  final bool dismissible;

  @override
  Color? get barrierColor => Colors.black45;

  @override
  bool get barrierDismissible => dismissible;

  @override
  String? get barrierLabel => "label";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    Animation<double> anim2 = CurvedAnimation(parent: animation, curve: Curves.bounceOut, reverseCurve: Curves.linear);
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.6, end: 1).animate(anim2),
        child: child,
      ),
    );
  }

  @override
  Duration get transitionDuration => AppUI.animationDuration;
}
