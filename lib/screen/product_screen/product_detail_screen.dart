import 'package:black_hole/core/constant/colors.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/model/menu.dart';
import 'package:black_hole/core/service/provider/product.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/card/product_title_card.dart';
import 'package:black_hole/widget/header/product_header.dart';
import 'package:black_hole/widget/tile/ingredient_tile.dart';
import 'package:black_hole/widget/tile/price_tile.dart';
import 'package:black_hole/widget/tile/size_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final MenuItemModel model;

  ProductDetailScreen({super.key, required this.model});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedSize = widget.model.sizes[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: false,
      backgroundColor: AppColor.black,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ProductHeader(imageURL: widget.model.imageURL, title: widget.model.title, productID: widget.model.id, isFavorited: context.watch<ProductProvider>().favoriteProducts?.items.any((item) => item.id == widget.model.id) ?? false),
            AppUI.verticalGap(),
            ProductTitleCard(title: widget.model.title, extra: widget.model.extra),
            AppUI.verticalGap(),
            Padding(
              padding: AppUI.pagePadding / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Description', style: AppTextStyle.productTitle),
                  AppUI.verticalGap(0.3),
                  Text('${widget.model.description}'),
                  AppUI.verticalGap(),
                  Text('Ingredients', style: AppTextStyle.productTitle),
                  AppUI.verticalGap(0.3),
                  SizedBox(
                    height: 40.h,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.model.ingredients.length,
                        itemBuilder: (context, index) {
                          return IngredientTile(title: widget.model.ingredients[index]);
                        }
                    ),
                  ),
                  AppUI.verticalGap(0.3),
                  Text('Size', style: AppTextStyle.productTitle),
                  SizedBox(
                    height: 85.h,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemExtent: 90.w,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.model.sizes.length,
                        itemBuilder: (context, index) {
                          widget.model.sizes.sort();
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = widget.model.sizes[index];
                                });
                              },
                              child: SizeTile(size: widget.model.sizes[index], isSelected: widget.model.sizes[index] == selectedSize)
                          );
                        }
                    ),
                  ),
                  AppUI.verticalGap(),
                  PriceTile(price: widget.model.prices.elementAt(widget.model.sizes.indexOf(selectedSize))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}