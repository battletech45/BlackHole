import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/model/campaign.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/colors.dart';

class NewsCard extends StatelessWidget {
  final CampaignModel model;

  const NewsCard({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/campaign/:${model.id}', extra: model);
      },
      child: Card(
        color: AppColor.cardBGDark,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r)
        ),
        child: Padding(
          padding: AppUI.productCardPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: CachedNetworkImage(
                  imageUrl: model.imageUrl,
                  height: 110.h,
                  fit: BoxFit.cover,
                ),
              ),
              AppUI.verticalGap(),
              Text(model.title, style: AppTextStyle.productTitle.copyWith(color: AppColor.white)),
              AppUI.verticalGap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Detaylar için'),
                  Icon(Icons.arrow_right_alt, color: AppColor.white)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}