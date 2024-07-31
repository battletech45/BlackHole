import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/service/provider/auth.dart';
import 'package:black_hole/core/service/provider/product.dart';
import 'package:black_hole/screen/auth_screen/guest_profile_screen.dart';
import 'package:black_hole/screen/favorite_screen/empty_favorite_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/constant/text_style.dart';
import '../../widget/card/product_card.dart';

class FavoriteScreen extends StatelessWidget {

  FavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppUI.pagePadding / 2,
        child: context.watch<AutherProvider>().isAuth ? Consumer<ProductProvider>(
          builder: (context, service, child) {
            if(service.favoriteProducts != null && service.favoriteProducts!.items.isNotEmpty) {
              return SingleChildScrollView(
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
                        itemCount: service.favoriteProducts?.items.length ?? 0,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                context.push('/product_detail', extra: service.favoriteProducts?.items[index]);
                              },
                              child: ProductCard(imageURL: service.favoriteProducts?.items[index].imageURL ?? '', title: service.favoriteProducts?.items[index].title ?? '', price: service.favoriteProducts?.items[index].prices[0] ?? '', extra: service.favoriteProducts?.items[index].extra, isFavorited: true)
                          );
                        }
                    ),
                    AppUI.verticalGap()
                  ],
                ),
              );
            }
            else {
              return EmptyScreen();
            }
          },
        ) : GuestProfileScreen(),
      ),
    );
  }
}