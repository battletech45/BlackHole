import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/text_style.dart';
import '../../core/constant/ui_const.dart';

class CampaignHeader extends StatelessWidget {
  final String title;
  final String imageURL;
  final String date;

  const CampaignHeader({super.key, required this.title, required this.imageURL, required this.date});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CachedNetworkImage(imageUrl: imageURL, height: 200.h, fit: BoxFit.cover),
        AppUI.verticalGap(),
        Text(title, style: AppTextStyle.bigButtonText),
        AppUI.verticalGap(0.1),
        Text(date, style: AppTextStyle.fieldHint)
      ],
    );
  }
}