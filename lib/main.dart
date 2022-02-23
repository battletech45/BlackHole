import 'package:black_hole/LoginPage.dart';
import 'package:flutter/material.dart';
import 'CenteralPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Black Hole Cafe',
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: new Container(
          margin: const EdgeInsets.only(top: 100.0),
          child: new Column(
            children: <Widget>[
              Image.asset('assets/BH_AccretionDisk_Sim_Stationary_WebSize.gif'),
              SizedBox(height: 100.0),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.local_cafe),
                        color: Colors.brown,
                        iconSize: 40,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) =>
                                  CenteralPage()));
                        }),
                    IconButton(icon: Icon(Icons.local_cafe),
                        color: Colors.brown,
                        iconSize: 40,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) =>
                                  SignInPage()));
                        }),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}