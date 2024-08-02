import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/service/firebase.dart';
import 'package:black_hole/core/service/provider/auth.dart';
import 'package:black_hole/core/service/provider/product.dart';
import 'package:black_hole/widget/button/square_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/constant/colors.dart';

class ProductHeader extends StatelessWidget {
  final String imageURL;
  final String title;
  final String productID;
  final bool isFavorited;

  const ProductHeader({super.key, required this.imageURL, required this.title, required this.isFavorited, required this.productID});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: 250.h,
          decoration: BoxDecoration(
              color: AppColor.productBGDark,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200.r),
                bottomRight: Radius.circular(200.r),
              )
          ),
        ),
        Padding(
          padding: AppUI.pagePadding,
          child: SizedBox(
            height: 300.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SquareButton(backgroundColor: AppColor.borderColor.withOpacity(0.5), icon: Icons.arrow_back_ios_new, iconColor: AppColor.white, paddingScale: 2, onTap: () {context.pop();}),
                    Text(title, style: AppTextStyle.bigButtonText),
                    SquareButton(
                        backgroundColor: AppColor.borderColor.withOpacity(0.5),
                        icon: isFavorited ? Icons.favorite : Icons.favorite_border,
                        iconColor: AppColor.white, paddingScale: 2,
                        onTap: () async {
                          if(context.read<AutherProvider>().isAuth) {
                            await FirebaseService.toggleProductFavorite(context.read<AutherProvider>().user?.uid ?? '', productID);
                            context.read<ProductProvider>().syncFavoritesFromFirebase(context.read<AutherProvider>().user?.uid ?? '');
                          }
                        }
                    ),
                  ],
                ),
                AppUI.verticalGap(),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Image.asset(AppAsset.productBG),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: CachedNetworkImage(imageUrl: imageURL, height: 150.h, width: 150.w, fit: BoxFit.cover)
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}