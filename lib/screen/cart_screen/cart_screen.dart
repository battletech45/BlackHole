import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/service/provider/product.dart';
import 'package:black_hole/widget/card/cart_product_card.dart';
import 'package:black_hole/widget/card/checkout_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../core/constant/assets.dart';
import '../../core/constant/ui_const.dart';
import '../../core/model/menu.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

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
              Consumer<ProductProvider>(
                builder: (context, service, child) {
                  return SizedBox(
                    height: 440.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: service.cart.length,
                        itemBuilder: (context, index) {
                          return CartProductCard(imageURL: AppAsset.testPhoto, title: 'El Salvador Finca Majan', size: 'small', price: '25.00');
                        }
                    ),
                  );
                },
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