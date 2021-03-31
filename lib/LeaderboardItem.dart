import 'package:flutter/material.dart';

class LeaderboardItem extends StatelessWidget {
  final String userName;
  final int point;

  LeaderboardItem({this.userName, this.point});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: ListTile(
          title: Text(userName),
          subtitle: Text(point.toString()),
        ),
      ),
    );
  }
}