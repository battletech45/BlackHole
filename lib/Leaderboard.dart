import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  Stream<QuerySnapshot> _users;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    final usersSnapshot = await FirebaseFirestore.instance.collection('users').snapshots();
    setState(() {
      _users = usersSnapshot;
    });
  }

  Widget LeaderboardBody() {
    return StreamBuilder <QuerySnapshot>(
      stream: _users,
      builder: (context, snapshot) {
        return snapshot.hasData ?
        ListView.builder(
          itemCount: snapshot.data.size,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return LeaderboardItem(
              userName: snapshot.data.docs[index].get("fullName"),
              point: snapshot.data.docs[index].get("point"),
            );
          }
        ) : CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown,
        title: Text('SKOR TABLOSU',style: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
      ),
      body: LeaderboardBody(),
    );
  }
}