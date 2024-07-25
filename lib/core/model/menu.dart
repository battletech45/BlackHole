import 'package:cloud_firestore/cloud_firestore.dart';

class MenuItemModel {
  final String title;
  final String? extra;
  final String description;
  final String imageURL;
  final List<String> ingredients;
  final List<String> sizes;
  final String price;

  MenuItemModel({
    required this.title,
    required this.extra,
    required this.imageURL,
    required this.description,
    required this.ingredients,
    required this.sizes,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'extra': extra,
      'imageURL': imageURL,
      'description': description,
      'ingredients': ingredients,
      'sizes': sizes,
      'price': price,
    };
  }

  factory MenuItemModel.fromDocument(DocumentSnapshot doc) {
    return MenuItemModel(
      title: doc['title'],
      extra: doc['extra'],
      imageURL: doc['imageURL'],
      description: doc['description'],
      ingredients: List<String>.from(doc['ingredients']),
      sizes: List<String>.from(doc['sizes']),
      price: doc['price'],
    );
  }
}
