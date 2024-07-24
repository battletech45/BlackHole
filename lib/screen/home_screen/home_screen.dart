import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/widget/header/home_header.dart';
import 'package:black_hole/widget/slider/home_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Padding(
        padding: AppUI.pagePadding / 3,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HomeHeader(),
              HomeCategorySlider(data: []),
              AppUI.verticalBlankSpace,
            ],
          ),
        ),
      ),
    );
  }
}