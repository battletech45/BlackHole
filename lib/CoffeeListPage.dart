import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoffeeListPage extends StatefulWidget {
  @override
  _CoffeeListPageState createState() => _CoffeeListPageState();
}

class _CoffeeListPageState extends State<CoffeeListPage> {

  @override
  void initState() {
    super.initState();
  }

  Widget noCoffeeWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.local_cafe, color: Colors.grey, size: 75.0),
            SizedBox(height: 20.0),
            Text("Burada hiç kahve yok !", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, fontStyle: FontStyle.italic))
          ],
        ),
      ),
    );
  }

  Widget coffeeList() {
    return StreamBuilder <DocumentSnapshot>(
      stream: _items,
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if(snapshot.hasData) {
          var data = snapshot.data;
          if (data != null && data['items'] != null) {
            if (data['items'].length != 0) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: data['items'].length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    int reqIndex = data['items'].length - index - 1;
                    return CoffeeTile(itemName: data['items'][reqIndex], itemImage: data['itemImage'][reqIndex], itemDescription: data['itemDescription'][reqIndex]);
                  }
              );
            }
            else {
              return noCoffeeWidget();
            }
          }
          else {
            return noCoffeeWidget();
          }
        }
        else {
          return Center(
              child: CircularProgressIndicator()
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enfes Tarifler', style: TextStyle(color: Colors.brown, fontSize: 30.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.brown,
      body: coffeeList(),
    );
  }
}