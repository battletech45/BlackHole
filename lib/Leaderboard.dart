import 'package:black_hole/LeaderboardItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  int length;

  @override
  void initState() {
    super.initState();
    _getLength();
  }

  _getLength() async {
    final QuerySnapshot qSnap = await FirebaseFirestore.instance.collection('users').get();
    final int collecLength = qSnap.docs.length;
    setState(() {
      length = collecLength;
    });
  }

  Widget Leaderboard() {
    final userRef = FirebaseFirestore.instance.collection('users');
    userRef.get().then((snapshot) {
      snapshot.docs.forEach((doc) {
        print(doc.data()['fullName']);
        print(doc.data()['email']);
        /*return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(doc.data()['fullName']),
              subtitle: Text(doc.data()['point'].toString()),
            );
          },
        );*/
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text('SKOR TABLOSU',style: TextStyle(color: Colors.brown, fontSize: 30.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
      ),
      body: Leaderboard(),
    );
  }
}