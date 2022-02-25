import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFİLİM', style: TextStyle(color: Colors.brown, fontSize: 30.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.brown, Colors.black])),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage("https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg"),
                      radius: 50.0,
                    ),
                    SizedBox(height: 10.0),
                    Text('Person', style: TextStyle(fontSize: 22.0, color: Colors.white)),
                    SizedBox(height: 10.0),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                children: [
                                  Text('Posts', style: TextStyle(color: Colors.redAccent, fontSize: 22.0, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5.0),
                                  Text('1200', style: TextStyle(fontSize: 20.0, color: Colors.pinkAccent)),
                                ],
                              )),
                          Expanded(
                              child: Column(
                                children: [
                                  Text('Followers', style: TextStyle(color: Colors.redAccent, fontSize: 22.0, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5.0),
                                  Text('21.2k', style: TextStyle(fontSize: 20.0, color: Colors.pinkAccent))
                                ]
                          )),
                          Expanded(
                              child: Column(
                                children: [
                                  Text('Follow', style: TextStyle(color: Colors.redAccent, fontSize: 22.0, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5.0),
                                  Text('1200', style: TextStyle(fontSize: 20.0, color: Colors.pinkAccent))
                                ],
                          )),
                        ],
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}