import 'package:black_hole/core/model/menu.dart';
import 'package:black_hole/core/service/firebase.dart';
import 'package:black_hole/core/service/log.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  Map<String, Map<String, dynamic>> cart = {};
  MenuModel? favoriteProducts;
  MenuModel? totalMenu;

  Future<void> init(User? user) async {
    await getMenuItems();
    if(user != null) {
      await syncFavoritesFromFirebase(user.uid);
    }
  }

  Future<void> getMenuItems() async {
    final res = await FirebaseService.getItems();
    totalMenu = res;
    notifyListeners();
  }

  Future<void> syncFavoritesFromFirebase(String userID) async {
    try {
      favoriteProducts = await FirebaseService.getUserFavorites(userID);
      notifyListeners();
    }
    catch(e) {
      LoggerService.logError(e.toString());
    }
  }
}