import 'package:black_hole/core/constant/colors.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';


class QrScreen extends StatefulWidget {
  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  late QrImage qrImage;
  @override
  void initState() {
    super.initState();

    final qrCode = QrCode.fromData(data: 'https://pub.dev/packages/pretty_qr_code', errorCorrectLevel: QrErrorCorrectLevel.H);

    qrImage = QrImage(qrCode);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: AppColor.white,
            padding: AppUI.pageFullSidePadding / 2,
            child: PrettyQrView(
              qrImage: qrImage,
              decoration: const PrettyQrDecoration(),
            ),
          ),
        ],
      ),
    );
  }
}