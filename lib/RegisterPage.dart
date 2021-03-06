import 'package:black_hole/CenteralPage.dart';
import 'package:black_hole/src/Firebase_Functions.dart';
import 'package:black_hole/src/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({this.toggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseFunctions _auth = FirebaseFunctions();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String fullName = '';
  String email = '';
  String password = '';
  String error = '';

  _onRegister() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      await _auth.registerWithEmailAndPassword(fullName, email, password).then((result) async {
        if (result != null) {

          await helperFunctions.saveUserLoggedInSharedPreference(true);
          await helperFunctions.saveUserEmailSharedPreferences(email);
          await helperFunctions.saveUserNameSharedPreference(fullName);
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CenteralPage()));
        }
        else {
          setState(() {
            error = 'Error while registering the user!';
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Container(
            color: Colors.black,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 80.0),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30.0),

                    Text("Register", style: TextStyle(color: Colors.white, fontSize: 25.0)),

                    SizedBox(height: 20.0),

                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'NAME',
                        hintStyle: TextStyle(color: Colors.white)
                      ),
                      style: TextStyle(color: Colors.white),
                      onChanged: (val) {
                        setState(() {
                          fullName = val;
                        });
                      },
                    ),

                    SizedBox(height: 15.0),

                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'EMAIL',
                          hintStyle: TextStyle(color: Colors.white)
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (val) {
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ? null : "Please enter a valid email";
                      },
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),

                    SizedBox(height: 15.0),

                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'PASSWORD',
                          hintStyle: TextStyle(color: Colors.white)
                      ),
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),

                    SizedBox(height: 20.0),

                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: RaisedButton(
                          elevation: 0.0,
                          color: Colors.brown,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                          onPressed: () {
                            _onRegister();
                          }
                      ),
                    ),

                    SizedBox(height: 10.0),

                    Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInPage()));
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10.0),

                    Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
