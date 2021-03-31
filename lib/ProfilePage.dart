import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  final String userName;
  final String email;

  ProfilePage({this.email, this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFİLİM', style: TextStyle(color: Colors.brown, fontSize: 30.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.brown,
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.account_circle, size: 200.0, color: Colors.blueGrey),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('İSİM', style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(userName, style: TextStyle(fontSize: 17.0)),
                ],
              ),
              Divider(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('EMAİL', style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(email, style: TextStyle(fontSize: 17.0)),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}