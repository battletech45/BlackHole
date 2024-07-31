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
      'favorites': [],
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
      await menuCollection.doc(newProductRef.id).update({'id': newProductRef.id});
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
      print('FOTOGRAF LINKI $downloadUrl');
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

  static Future<bool> toggleProductFavorite(String userID, String productID) async {
    try {
      DocumentSnapshot userSnapshot = await userCollection.doc(userID).get();
      List<dynamic> favorites = await userSnapshot.get('favorites');

      if(favorites.contains(productID)) {
        await userCollection.doc(userID).update({
          'favorites': FieldValue.arrayRemove([productID])
        });
      }
      else {
        await userCollection.doc(userID).update({
          'favorites': FieldValue.arrayUnion([productID])
        });
      }
      return true;
    }
    catch(e) {
      LoggerService.logError(e.toString());
      rethrow;
    }
  }

  static Future<MenuModel?> getItems() async {
    try {
      QuerySnapshot querySnapshot = await menuCollection.get();
      return MenuModel.fromDocument(querySnapshot.docs);
    }
    catch(e) {
      LoggerService.logError(e.toString());
      rethrow;
    }
  }

  static Future<DocumentSnapshot?> getUserData(String userID) async {
    try {
      return await userCollection.doc(userID).get();
    }
    catch(e) {
      LoggerService.logError(e.toString());
      rethrow;
    }
  }

  static Future<MenuModel?> getUserFavorites(String userID) async {
    try {
      DocumentSnapshot userDoc = await userCollection.doc(userID).get();
      List<DocumentSnapshot> favData = [];
      final List<dynamic> favItemIDs = userDoc.get('favorites');

      final tempData = await menuCollection.get();
      favItemIDs.forEach((element) {
        tempData.docs.forEach((doc) {
          if(doc.id == element) {
            favData.add(doc);
          }
        });
      });

      MenuModel model = MenuModel.fromDocument(favData);
      return model;
    }
    catch(e) {
      LoggerService.logError(e.toString());
      rethrow;
    }
  }

  static Future<bool> getIsUserAdmin(String userID) async {
    try {
      final userDoc = await userCollection.doc(userID).get();
      return userDoc['isAdmin'];
    }
    catch(e) {
      LoggerService.logError(e.toString());
      return false;
    }
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