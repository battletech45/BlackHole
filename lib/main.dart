import 'package:black_hole/LoginPage.dart';
import 'package:black_hole/firebase_options.dart';
import 'package:black_hole/src/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slider_button/slider_button.dart';

import 'CenteralPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class sliderButton extends StatefulWidget {

  @override
  State<sliderButton> createState() => _sliderButtonState();
}

class _sliderButtonState extends State<sliderButton> {

  bool isLoggedIn = false;
  bool isAdmin = false;

  _checkUserStatus() async {
    var savedLoggedIn = await helperFunctions.getUserLoggedInSharedPreference();
    print(isLoggedIn);
    if(savedLoggedIn != null){
      setState(() {
        isLoggedIn = savedLoggedIn;
      });
    }
    print(isLoggedIn);
    var savedEmail = await helperFunctions.getUserEmailSharedPreference();
    if(savedEmail == "taneri862@gmail.com") {
      setState(() {
        isAdmin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return SliderButton(
      label: Text('SLIDE TO UNLOCK !', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
      action: () {
        if(isLoggedIn) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CentralPage()));
        }
        else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInPage()));
        }
      },
      icon: Center(
        child: Icon(Icons.coffee),
      ),
      backgroundColor: Colors.brown[800],
      buttonColor: Colors.brown[500],
      buttonSize: 60.0,
      width: 250.0,
      radius: 25.0,
      height: 60.0,
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/BH_AccretionDisk_Sim_Stationary_WebSize.gif'),
              SizedBox(height: 100.0),
              sliderButton()
            ],
          ),
        ),
      ),
    );
  }
}