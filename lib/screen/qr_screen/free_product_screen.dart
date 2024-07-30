import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/service/firebase.dart';
import 'package:black_hole/core/util/extension.dart';
import 'package:black_hole/widget/base/appbar.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/button/loading_button.dart';
import 'package:black_hole/widget/dialog/alert_dialog.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/text_style.dart';

class FreeProductScreen extends StatefulWidget {
  const FreeProductScreen({super.key});
  @override
  State<FreeProductScreen> createState() => _FreeProductScreenState();
}

class _FreeProductScreenState extends State<FreeProductScreen> {
  String? _scanBarcode = 'Unknown';

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }


  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: false,
      backgroundColor: AppColor.backgroundDark,
      appBar: AppAppBar(
        isDrawer: false,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Hediye Ürün için QR'ı Okuyun !", style: AppTextStyle.ratingOverallText),
          AppUI.verticalGap(),
          SizedBox(
            height: 50.h,
            width: 250.w,
            child: LoadingButton(
              backgroundColor: AppColor.buttonBG,
                child: Text('TARA', style: AppTextStyle.bigButtonText.copyWith(color: AppColor.white)),
                onTap: () async {
                  await scanQR().then((value) async {
                    if(_scanBarcode != null) {
                      final process = await FirebaseService.getFreeProduct(_scanBarcode!);
                      context.showAppDialog(
                          AppAlertDialog(
                            type: process ? AlertType.approved : AlertType.denied,
                            title: process ? 'Başarılı !' : 'Hata !',
                            text: process ? 'QR Okuma Başarılı Oldu.' : 'Hediye Ürün İçin Yeterli Puan Yok.',
                            isSingleButton: true,
                          )
                      ).then((val) {
                        context.pop();
                      });
                    }
                  });
                }
            ),
          )
        ],
      ),
    );
  }
}