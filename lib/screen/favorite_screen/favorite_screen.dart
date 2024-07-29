import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/screen/favorite_screen/empty_favorite_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/constant/assets.dart';
import '../../core/constant/text_style.dart';
import '../../core/model/menu.dart';
import '../../widget/card/product_card.dart';

class FavoriteScreen extends StatelessWidget {

  final data = [];

  FavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppUI.pagePadding / 2,
        child: data.isEmpty ? EmptyFavoriteScreen() : SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Favorilerin', style: AppTextStyle.homeHeader),
              AppUI.verticalGap(),
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15.h,
                    crossAxisSpacing: 15.w,
                    childAspectRatio: 0.75
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.push('/product_detail', extra: data[index]);
                      },
                        child: ProductCard(imageURL: data[index].imageURL, title: data[index].title, price: data[index].price, extra: data[index].extra, isFavorited: true)
                    );
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