import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../core/constant/colors.dart';
import '../../core/model/campaign.dart';
import '../../widget/base/appbar.dart';

class CampaignDetailScreen extends StatelessWidget {
  final CampaignModel model;

  CampaignDetailScreen({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(isDrawer: false),
      backgroundImage: false,
      backgroundColor: AppColor.black,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: AppUI.pageFullSidePadding / 2,
          child: Column(
            children: <Widget>[
              CachedNetworkImage(imageUrl: model.imageUrl),
              AppUI.verticalGap(),
              Text(model.title, style: AppTextStyle.ratingOverallText),
              AppUI.verticalGap(0.5),
              Text(model.date.toString(), style: AppTextStyle.fieldHint),
              AppUI.verticalGap(),
              Text(model.content),
              AppUI.verticalGap(2),
            ],
          ),
        ),
      ),
    );
  }
}