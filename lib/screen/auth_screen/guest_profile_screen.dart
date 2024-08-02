import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/ui_const.dart';
import '../../widget/button/loading_button.dart';

class GuestProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(AppAsset.appLogo),
          AppUI.verticalGap(),
          Text('Hesabınıza Giriş Yapın !', style: AppTextStyle.homeHeader),
          AppUI.verticalGap(),
          SizedBox(
            height: 55.h,
            width: 250.w,
            child: LoadingButton(
                onTap: () async {
                  context.push('/login');
                },
                backgroundColor: AppColor.buttonBG,
                child: Text('Giriş Yap', style: AppTextStyle.buttonTextStyle)
            ),
          ),
        ],
      ),
    );
  }
}