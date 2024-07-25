import 'package:black_hole/core/constant/colors.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/model/menu.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/card/product_title_card.dart';
import 'package:black_hole/widget/header/product_header.dart';
import 'package:black_hole/widget/slider/home_slider.dart';
import 'package:black_hole/widget/tile/ingredient_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailScreen extends StatelessWidget {
  final MenuItemModel model;

  ProductDetailScreen({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: false,
      backgroundColor: AppColor.black,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ProductHeader(imageURL: model.imageURL, title: model.title),
            AppUI.verticalGap(),
            ProductTitleCard(title: model.title, extra: model.extra),
            AppUI.verticalGap(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Description', style: AppTextStyle.productTitle),
                AppUI.verticalGap(0.3),
                Text('A cappuaccino is a coffee - based brink made primarily form espresso and milk.'),
                AppUI.verticalGap(),
                Text('Ingredients', style: AppTextStyle.productTitle),
                AppUI.verticalGap(0.3),
                SizedBox(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: model.ingredients.length,
                      itemBuilder: (context, index) {
                        return IngredientTile(title: model.ingredients[index]);
                      }
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}