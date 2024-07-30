import 'package:black_hole/widget/button/loading_button.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/cupertino.dart';

class QrReaderScreen extends StatefulWidget {
  @override
  State<QrReaderScreen> createState() => _QrReaderScreenState();
}

class _QrReaderScreenState extends State<QrReaderScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LoadingButton(
              child: Text('TARA'),
              onTap: () async {
                await FlutterBarcodeScanner();
              }
          )
        ],
      ),
    );
  }
}