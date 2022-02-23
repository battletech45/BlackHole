import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:qr_code_scanner/qr_code_scanner.dart' as scanner;


class qrCodePage extends StatefulWidget {
  @override
  _qrCodePageState createState() => _qrCodePageState();
}

class _qrCodePageState extends State<qrCodePage> {
  TextEditingController _inputController;
  TextEditingController _outputController;

  @override
  void initState() {
    super.initState();
    this._outputController = new TextEditingController();
    this._inputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lezzetlere Dal', style: TextStyle(color: Colors.brown, fontSize: 30.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                //onPressed: _scan,
                child: const Text('Start Camera Scan'),
              ),
            )
          ],
        ),
      ));
  }
/*
  Future _scan() async {

    await Permission.camera.request();
    String barcode = await scanner.BarcodeFormat.values.toString();
    if(barcode == null) {
      print('nothing return');
    }
    else {
      this._outputController.text = barcode;
    }
  }
  */
}