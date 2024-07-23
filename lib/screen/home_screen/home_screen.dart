import 'package:black_hole/core/constant/navigation.dart';
import 'package:black_hole/core/model/screen.dart';
import 'package:black_hole/widget/base/bottom_navbar.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget implements AppScreen {
  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  ScreenName get name => ScreenName.home;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: AppNavigation.bottomNavBarNavigationList.indexOf(widget.name),
      ),
      child: SingleChildScrollView(),
    );
  }
}