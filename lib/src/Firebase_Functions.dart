import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
  final String userID;

  FirebaseFunctions({this.userID});

  final CollectionReference coffeeCollection = FirebaseFirestore.instance.collection('menu');
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ModelUser _userFromFirebaseUser(User user) {
    return (user != null) ? ModelUser(userID: user.uid) : null;
  }

  Future<Stream<DocumentSnapshot>> getItems() async {
    return FirebaseFirestore.instance.collection('menu').doc('hRtDOwlN89qrLvQeWTIW').snapshots();
  }

  Future updateUserData(String fullName, String email, String password) async {
    return await userCollection.doc(userID).set({
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
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String fullName, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      await FirebaseFunctions(userID: user.uid).updateUserData(fullName, email, password);
      return _userFromFirebaseUser(user);
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
class ModelUser {
  final String userID;

  ModelUser({
    this.userID
});
}