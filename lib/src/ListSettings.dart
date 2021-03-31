import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String itemName;
  final String itemImage;
  final String itemDescription;

  CoffeeTile({this.itemName, this.itemImage, this.itemDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.brown,
                  content: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.close),
                            backgroundColor: Colors.brown,
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.network(itemImage, width: 50.0, height: 50.0),
                              Text(itemName)
                            ],
                          ),
                          Text(itemDescription, style: TextStyle(color: Colors.white, fontSize: 15.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                );
              }
            );
          },
          child: Card(
            child: Column(
              children: [
                Image.network(itemImage, width: 165.0, height: 165.0),
              ],
            ),
          ),
        ),
    );
  }
}