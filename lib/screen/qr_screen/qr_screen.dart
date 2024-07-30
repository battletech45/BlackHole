import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/constant/colors.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/service/provider/auth.dart';
import 'package:black_hole/widget/base/appbar.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/button/loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});
  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  late QrImage qrImage;
  @override
  void initState() {
    super.initState();

    final qrCode = QrCode.fromData(data: '${context.read<AutherProvider>().user!.uid}', errorCorrectLevel: QrErrorCorrectLevel.H);

    qrImage = QrImage(qrCode);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: false,
      backgroundColor: AppColor.backgroundDark,
      appBar: AppAppBar(
        isDrawer: false,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("QR'ınız Hazır ", style: AppTextStyle.authTitle),
            AppUI.verticalGap(),
            Container(
              width: 300.w,
              height: 300.h,
              color: AppColor.white,
              padding: AppUI.pageFullSidePadding / 2,
              child: PrettyQrView(
                qrImage: qrImage,
                decoration: const PrettyQrDecoration(
                  image: PrettyQrDecorationImage(
                    image: AssetImage(AppAsset.appLogoWBg)
                  )
                ),
              ),
            ),
            AppUI.verticalGap(2),
            SizedBox(
              height: 50.h,
              width: 250.w,
              child: LoadingButton(
                backgroundColor: AppColor.buttonBG,
                onTap: () async {
                  context.pop();
                },
                child: Text('Geri Dön', style: AppTextStyle.bigButtonText.copyWith(color: AppColor.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}