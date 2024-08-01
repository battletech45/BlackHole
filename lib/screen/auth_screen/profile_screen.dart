import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/service/provider/auth.dart';
import 'package:black_hole/screen/auth_screen/guest_profile_screen.dart';
import 'package:black_hole/widget/tile/navigation_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/constant/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppUI.pagePadding / 2,
        child: !context.watch<AutherProvider>().isAuth ? GuestProfileScreen() : SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Profil', style: AppTextStyle.homeHeader),
              AppUI.verticalGap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: AppUI.pageFullSidePadding / 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(
                          color: AppColor.selectedBorderColor,
                          width: 1
                        )
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.r),
                          child: CachedNetworkImage(imageUrl: context.watch<AutherProvider>().user?.photoURL ?? '', width: 70.w, height: 70.h, fit: BoxFit.cover, errorWidget: (context,___, __) {
                            return Image.asset(AppAsset.appLogo, width: 70.w, height: 70.h, fit: BoxFit.cover);
                          })
                      )
                  ),
                  AppUI.horizontalGap(),
                  Text(context.watch<AutherProvider>().user?.displayName ?? 'Coffee Bean', style: AppTextStyle.homeHeader),
                ],
              ),
              AppUI.verticalGap(),
              GestureDetector(
                onTap: () {
                  context.push('/qrGenerate');
                },
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: AppUI.pageFullSidePadding,
                        decoration: BoxDecoration(
                            color: AppColor.cardBGDark,
                            borderRadius: BorderRadius.circular(15.r)
                        ),
                        child: NavigationTile(title: 'QR Oluştur')
                    ),
                    AppUI.verticalGap(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push('/qrRead');
                },
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: AppUI.pageFullSidePadding,
                        decoration: BoxDecoration(
                            color: AppColor.cardBGDark,
                            borderRadius: BorderRadius.circular(15.r)
                        ),
                        child: NavigationTile(title: 'QR Okut')
                    ),
                    AppUI.verticalGap(),
                  ],
                ),
              ),
              Visibility(
                visible: context.watch<AutherProvider>().isAdmin,
                child: GestureDetector(
                  onTap: () {
                    context.push('/qrFree');
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: AppUI.pageFullSidePadding,
                          decoration: BoxDecoration(
                            color: AppColor.cardBGDark,
                            borderRadius: BorderRadius.circular(15.r)
                          ),
                          child: NavigationTile(title: 'Hediye Ürün')
                      ),
                      AppUI.verticalGap(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push('/addProduct');
                },
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: AppUI.pageFullSidePadding,
                        decoration: BoxDecoration(
                          color: AppColor.cardBGDark,
                          borderRadius: BorderRadius.circular(15.r)
                        ),
                        child: NavigationTile(title: 'Ürün Ekle')
                    ),
                    AppUI.verticalGap(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push('/addNews');
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: AppUI.pageFullSidePadding,
                      decoration: BoxDecoration(
                        color: AppColor.cardBGDark,
                        borderRadius: BorderRadius.circular(15.r)
                      ),
                      child: NavigationTile(title: 'Haber / Kampanya Ekle'),
                    ),
                    AppUI.verticalGap(2)
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await context.read<AutherProvider>().signOut().then((e) {
                    context.go('/');
                  });
                  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.logout, color: AppColor.red),
                    AppUI.horizontalGap(0.2),
                    Text('Logout', style: AppTextStyle.bigButtonText.copyWith(color: AppColor.red))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}