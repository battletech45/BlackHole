import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/model/campaign.dart';
import 'package:black_hole/core/service/firebase.dart';
import 'package:black_hole/widget/card/campaign_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constant/ui_const.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  List<CampaignModel?> news = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final data = await FirebaseService.getNews();
    if(data != null) {
      data.forEach((element) {
        setState(() {
          news.add(CampaignModel.fromDocument(element));
        });
      });
    }
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppUI.pagePadding / 2,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AppUI.verticalGap(),
              SizedBox(
                  width: 250.w,
                  child: Text("Black Hole'den Haberler", style: AppTextStyle.homeHeader, textAlign: TextAlign.center)
              ),
              AppUI.verticalGap(),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.h,
                  crossAxisSpacing: 15.w,
                  childAspectRatio: 0.8
                ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: news.length,
                itemBuilder: (context, index) {
                  if(news.isNotEmpty) {
                    return NewsCard(model: news[index]!);
                  }
                  else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              AppUI.verticalGap()
            ],
          ),
        )
      ),
    );
  }
}