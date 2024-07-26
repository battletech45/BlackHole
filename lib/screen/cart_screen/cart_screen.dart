import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/widget/card/cart_product_card.dart';
import 'package:black_hole/widget/card/checkout_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constant/assets.dart';
import '../../core/constant/ui_const.dart';
import '../../core/model/menu.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final data = [
    MenuItemModel(title: 'El Salvador Finca Majan', extra: 'extra', imageURL: AppAsset.testPhoto, description: 'description', ingredients: ['test', 'test'], sizes: ['short', 'tall', 'grande', 'venti'], price: '200'),
    MenuItemModel(title: 'Cappuccino', extra: 'extra', imageURL: AppAsset.testPhoto, description: 'description', ingredients: ['test', 'test'], sizes: ['short', 'tall', 'grande', 'venti'], price: '200'),
    MenuItemModel(title: 'Cappuccino', extra: 'extra', imageURL: AppAsset.testPhoto, description: 'description', ingredients: ['test', 'test'], sizes: ['short', 'tall', 'grande', 'venti'], price: '200'),
    MenuItemModel(title: 'Cappuccino', extra: 'extra', imageURL: AppAsset.testPhoto, description: 'description', ingredients: ['test', 'test'], sizes: ['short', 'tall', 'grande', 'venti'], price: '200'),
    MenuItemModel(title: 'Cappuccino', extra: 'extra', imageURL: AppAsset.testPhoto, description: 'description', ingredients: ['test', 'test'], sizes: ['short', 'tall', 'grande', 'venti'], price: '200'),
    MenuItemModel(title: 'Cappuccino', extra: 'extra', imageURL: AppAsset.testPhoto, description: 'description', ingredients: ['test', 'test'], sizes: ['short', 'tall', 'grande', 'venti'], price: '200'),
    MenuItemModel(title: 'Cappuccino', extra: 'extra', imageURL: AppAsset.testPhoto, description: 'description', ingredients: ['test', 'test'], sizes: ['short', 'tall', 'grande', 'venti'], price: '200'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppUI.pagePadding / 2,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Sepet', style: AppTextStyle.homeHeader),
              AppUI.verticalGap(),
              SizedBox(
                height: 440.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return CartProductCard(imageURL: AppAsset.testPhoto, title: 'El Salvador Finca Majan', size: 'small', price: '25.00');
                    }
                ),
              ),
              AppUI.verticalGap(),
              CheckoutCard(price: '25.00', discount: '25.00')
            ],
          ),
        ),
      ),
    );
  }
}