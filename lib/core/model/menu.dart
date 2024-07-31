import 'package:cloud_firestore/cloud_firestore.dart';

class MenuModel {
  final List<MenuItemModel> items;

  MenuModel({
    required this.items
  });

  factory MenuModel.fromDocument(List<DocumentSnapshot> docs) {
    List<MenuItemModel> dataList = [];
    if(docs.isNotEmpty) {
      docs.forEach((element) {
        dataList.add(MenuItemModel.fromDocument(element));
      });
    }
    return MenuModel(items: dataList);
  }
}

class MenuItemModel {
  final String id;
  final String title;
  final String? extra;
  final String description;
  final String imageURL;
  final List<String> ingredients;
  final List<String> sizes;
  final List<String> prices;

  MenuItemModel({
    required this.id,
    required this.title,
    required this.extra,
    required this.imageURL,
    required this.description,
    required this.ingredients,
    required this.sizes,
    required this.prices,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'extra': extra,
      'imageURL': imageURL,
      'description': description,
      'ingredients': ingredients,
      'sizes': sizes,
      'price': prices,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuItemModel && other.id == id;
  }

  factory MenuItemModel.fromDocument(DocumentSnapshot doc) {
    return MenuItemModel(
      id: doc['id'],
      title: doc['title'],
      extra: doc['extra'],
      imageURL: doc['imageURL'],
      description: doc['description'],
      ingredients: List<String>.from(doc['ingredients']),
      sizes: List<String>.from(doc['sizes']),
      prices: List<String>.from(doc['prices']),
    );
  }
}
