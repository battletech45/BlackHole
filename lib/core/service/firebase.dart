import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/category.dart';

class FirebaseService {
  //Private Constructor
  FirebaseService._();
  //Static Constructor
  static final FirebaseService instance = FirebaseService._();

  static final CollectionReference menuCollection = FirebaseFirestore.instance.collection('menu');
  static final CollectionReference categoryCollection = FirebaseFirestore.instance.collection('categories');
  static final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  static Future<void> createUser(String userID, String fullName, String email, String phoneNumber) async {
    await userCollection.doc(userID).set({
      'displayName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
      'updatedAt': DateTime.now().millisecondsSinceEpoch,
      'settings': {
        'notifications': true,
        'darkMode': false,
        'language': 'TR'
      },
    });
  }

  static Future<void> createMenuItem(String title, String extra, String imageURL, String description, List<String> ingredients, List<String> sizes, String price) async {
    await menuCollection.add({
      'title': title,
      'extra': extra,
      'description': description,
      'ingredients': ingredients,
      'imageURL': imageURL,
      'sizes': sizes,
      'price': price
    });
  }

  static Future<QuerySnapshot> getItems() async {
    return await menuCollection.get();
  }

  static Future<List<MenuItemModel>?> getCategories() async {
    QuerySnapshot snapshot = await categoryCollection.get();
    return snapshot.docs.map((doc) => MenuItemModel.fromDocument(doc)).toList();
  }

  static Future<DocumentSnapshot> getUserData(String userID) async {
    DocumentSnapshot snapshot = await userCollection.doc(userID).get();
    return snapshot;
  }
}