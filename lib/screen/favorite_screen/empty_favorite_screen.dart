import 'package:black_hole/core/constant/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/text_style.dart';
import '../../core/constant/ui_const.dart';
import '../../widget/button/loading_button.dart';

class EmptyFavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                color: AppColor.backgroundDark
              ),
              child: Lottie.asset(AppAsset.emptyFavLottie, repeat: true)
          ),
          AppUI.verticalGap(),
          Text('Eklemek için menüye gözatın !', style: AppTextStyle.authTitle),
          AppUI.verticalGap(),
          SizedBox(
            height: 55.h,
            width: 250.w,
            child: LoadingButton(
                onTap: () async {
                  context.go('/');
                },
                backgroundColor: AppColor.buttonBG,
                child: Text('Keşfet', style: AppTextStyle.buttonTextStyle)
            ),
          ),
        ],
      ),
    );
  }
}