import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/service/provider/auth.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/constant/colors.dart';

class ProfileTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(
                width: 1,
                color: AppColor.buttonBG
              )
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: CachedNetworkImage(
                imageUrl: context.watch<AutherProvider>().user?.photoURL ?? AppAsset.appLogo,
              ),
            ),
          ),
          Text(context.watch<AutherProvider>().user!.displayName ?? '')
        ],
      ),
    );
  }
}