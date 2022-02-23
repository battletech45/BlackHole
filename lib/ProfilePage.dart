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
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepOrange, Colors.pinkAccent]
              )
            ),
            child: Container(
              width: double.infinity,
              height: 350.0,
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
                  Card(margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
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
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Info', style: TextStyle(color: Colors.redAccent, fontStyle: FontStyle.normal, fontSize: 28.0)),
                    SizedBox(height: 10.0),
                    Text('INFOINFOINFOINFOINFOINFOINFOINFOINFOINFOINFOINFOINFOINFOINFOINFOINFOINFOINFO', style: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300, color: Colors.black, letterSpacing: 2.0))
                  ],
                ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 300.0,
            child: ElevatedButton(
              onPressed: (){},
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.pink, Colors.pinkAccent]
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text('Contact me', style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight: FontWeight.w300)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}