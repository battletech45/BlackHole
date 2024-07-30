import 'dart:io';

import 'package:black_hole/core/service/log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/menu.dart';

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
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
      'points': 0,
      'isAdmin': false
    });
  }

  static Future<String?> createMenuItem(String title, String? extra, String description, List<String> ingredients, List<String> sizes, List<String> prices) async {
    try {
      DocumentReference newProductRef = await menuCollection.add({
        'title': title,
        'extra': extra,
        'description': description,
        'ingredients': ingredients,
        'sizes': sizes,
        'prices': prices
      });
      return newProductRef.id;
    }
    catch(e) {
      LoggerService.logError(e.toString());
      rethrow;
    }
  }

  static Future<bool> uploadImageToFirebase(String productID, File imageFile) async {
    try {
      String fileName = 'productImages/${productID}';
      Reference storageRef = FirebaseStorage.instance.ref().child(fileName);

      UploadTask uploadTask = storageRef.putFile(imageFile);
      await uploadTask.whenComplete(() => {
        LoggerService.logInfo('Image file uploaded.')
      });
      String downloadUrl = await storageRef.getDownloadURL();
      await menuCollection.doc(productID).update({
        'imageURL': downloadUrl
      });
      return true;
    }
    catch(e) {
      LoggerService.logError(e.toString());
      rethrow;
    }
  }

  static Future<bool> updateUserPoint(String userID) async {
    try {
      await userCollection.doc(userID).update({
        'points': FieldValue.increment(1)
      });
      return true;
    }
    catch(e) {
      LoggerService.logError(e.toString());
      rethrow;
    }
  }

  static Future<QuerySnapshot> getItems() async {
    return await menuCollection.get();
  }

  static Future<bool> getIsUserAdmin(String userID) async {
    final userDoc = await userCollection.doc(userID).get();
    return userDoc['isAdmin'];
  }

  static Future<List<MenuItemModel>?> getCategories() async {
    QuerySnapshot snapshot = await categoryCollection.get();
    return snapshot.docs.map((doc) => MenuItemModel.fromDocument(doc)).toList();
  }

  static Future<bool> getFreeProduct(String userID) async {
    try {
      final DocumentSnapshot userDoc = await userCollection.doc(userID).get();
      if(userDoc['points'] >= 10) {
        await userCollection.doc(userID).update({
          'points': FieldValue.increment(-10)
        });
        return true;
      }
      return false;
    }
    catch(e) {
      LoggerService.logError(e.toString());
      rethrow;
    }
  }
}