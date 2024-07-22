import 'package:flutter/material.dart';
import '../constant/navigation.dart';

abstract class AppScreen extends Widget {
  final ScreenName name;
  const AppScreen._(this.name);
}

mixin ScaffoldlessScreen implements AppScreen {}

abstract class AppBottomSheet extends Widget {
  const AppBottomSheet._();
}

abstract class AppDialog extends Widget {
  const AppDialog._();
}
