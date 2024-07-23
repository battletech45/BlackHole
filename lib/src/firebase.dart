import 'package:black_hole/core/service/provider/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class FirebaseService {
  //Private Constructor
  FirebaseService._();
  //Static Constructor
  static final FirebaseService instance = FirebaseService._();

  static final CollectionReference coffeeCollection = FirebaseFirestore.instance.collection('menu');
  static final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  static Future<void> createUser(String userID, String fullName, String email, String phoneNumber) async {
    return await userCollection.doc(userID).set({
      'displayName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'lastSeen': DateTime.now().millisecondsSinceEpoch,
      'profilePictureUrl': '',
      'createdAt': DateTime.now().millisecondsSinceEpoch,
      'updatedAt': DateTime.now().millisecondsSinceEpoch,
      'friends': [],
      'blockedUsers': [],
      'chats': [],
      'settings': {
        'notifications': true,
        'darkMode': false,
        'isAdmin': false,
        'language': 'TR'
      },
    });
  }

  Future<Stream<DocumentSnapshot>> getItems() async {
    return FirebaseFirestore.instance.collection('menu').doc('hRtDOwlN89qrLvQeWTIW').snapshots();
  }

  static Future<void> updateUserData(String fullName, String email, String password) async {
    await userCollection.doc().set({
      'fullName': fullName,
      'email': email,
      'password': password,
      'favorites': [],
      'points': '',
      'profilePic': ''
    });
  }


  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user ?? null;
      return user;
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String fullName, String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user ?? null;

      await FirebaseService.updateUserData(fullName, email, password);
      return user;
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

   Future<QuerySnapshot> getUserData(String email) async {
    QuerySnapshot snapshot = await userCollection.where('email', isEqualTo: email).get();
    return snapshot;
  }
}