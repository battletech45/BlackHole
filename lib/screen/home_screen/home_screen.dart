import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/widget/card/product_card.dart';
import 'package:black_hole/widget/header/home_header.dart';
import 'package:black_hole/widget/slider/home_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/model/menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {

  final data = [
    MenuItemModel(title: 'Cappuccino', extra: 'extra', imageURL: AppAsset.testPhoto, description: 'description', ingredients: ['test', 'test'], sizes: ['size', 'size'], price: '200'),
    MenuItemModel(title: 'mest', extra: 'extra', imageURL: AppAsset.productTest, description: 'description', ingredients: ['test', 'test'], sizes: ['size', 'size'], price: '200'),
    MenuItemModel(title: 'sest', extra: 'extra', imageURL: AppAsset.testPhoto, description: 'description', ingredients: ['test', 'test'], sizes: ['size', 'size'], price: '200'),
    MenuItemModel(title: 'cest', extra: 'extra', imageURL: AppAsset.testPhoto, description: 'description', ingredients: ['test', 'test'], sizes: ['size', 'size'], price: '200'),
    MenuItemModel(title: 'vest', extra: 'extra', imageURL: AppAsset.testPhoto, description: 'description', ingredients: ['test', 'test'], sizes: ['size', 'size'], price: '200'),
    MenuItemModel(title: 'xest', extra: 'extra', imageURL: AppAsset.testPhoto, description: 'description', ingredients: ['test', 'test'], sizes: ['size', 'size'], price: '200')
  ];
  
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Padding(
        padding: AppUI.pagePadding / 2,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HomeHeader(),
              HomeCategorySlider(data: data),
              AppUI.verticalBlankSpace,
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15.h,
                    crossAxisSpacing: 15.w,
                    childAspectRatio: 0.75
                  ),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.push('/product_detail', extra: data[index]);
                      },
                        child: ProductCard(imageURL: data[index].imageURL, title: data[index].title, price: data[index].price, extra: data[index].extra, isFavorited: false)
                    );
                  }
              ),
              AppUI.verticalGap(2)
            ],
          ),
        ),
      ),
    );
  }
}