import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/widget/card/product_card.dart';
import 'package:black_hole/widget/header/home_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/model/menu.dart';
import '../../core/service/firebase.dart';
import '../../core/service/provider/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  MenuModel? menuFuture;
  
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getMenuItems();
  }

  Future<void> getMenuItems() async {
    final data = await FirebaseService.getItems();
    setState(() {
      menuFuture = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Padding(
        padding: AppUI.pagePadding / 2,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AppUI.verticalGap(),
              HomeHeader(),
              //HomeCategorySlider(data: data),
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
                  itemCount: menuFuture?.items.length ?? 0,
                  itemBuilder: (context, index) {
                    if(menuFuture != null) {
                      bool comparison = false;
                      if(context.watch<ProductProvider>().favoriteProducts != null && context.watch<ProductProvider>().favoriteProducts!.items.isNotEmpty) {
                        comparison = (context.watch<ProductProvider>().favoriteProducts?.items[index].id == menuFuture!.items[index].id);
                      }
                      return GestureDetector(
                          onTap: () {
                            context.push('/product_detail', extra: menuFuture!.items[index]);
                          },
                          child: ProductCard(imageURL: menuFuture!.items[index].imageURL, title: menuFuture!.items[index].title, price: menuFuture!.items[index].prices[0], extra: menuFuture!.items[index].extra, isFavorited: comparison)
                      );
                    }
                    else {
                      return const SizedBox.shrink();
                    }
                  }
              ),
              AppUI.verticalGap()
            ],
          ),
        ),
      ),
    );
  }
}