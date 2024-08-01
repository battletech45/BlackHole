import 'package:black_hole/core/service/log.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase.dart';
import '../../model/login.dart';

class AutherProvider with ChangeNotifier {
  User? user;
  LoginModel? loginModel;
  bool isAdmin = false;
  bool _showOnboard = true;

  final _loginKey = 'login';
  final _googleKey = 'google';
  final _onboardKey = 'onboard';

  bool get isAuth => user != null;
  bool get showOnboard => _showOnboard;

  Future<void> init() async {
    loginModel = await _readShared();
    if (loginModel != null) {
        await login(loginModel!);
        isAdmin = await FirebaseService.getIsUserAdmin(user!.uid);
    }
    else {
      if(FirebaseAuth.instance.currentUser != null) {
        user = FirebaseAuth.instance.currentUser;
        isAdmin = await FirebaseService.getIsUserAdmin(user!.uid);
        LoggerService.logInfo('This user logged in before via Google.');
      }
    }
  }

  Future<LoginModel?> _readShared() async {
    LoggerService.logInfo('Starting to read Shared');
    final pref = await SharedPreferences.getInstance();
    //Start onboard preference read
    if(pref.containsKey(_onboardKey)) {
      final tmpBool = pref.getBool(_onboardKey);
      LoggerService.logInfo('$_onboardKey key exists. tmpBool: $tmpBool');
      if(tmpBool != null) {
        _showOnboard = tmpBool;
      }
    }
    else {
      LoggerService.logInfo('Reading completed. No OnboardData in Shared');
    }
    //End onboard preference read
    if (pref.containsKey(_loginKey)) {
      final tmpJson = pref.getString(_loginKey);
      LoggerService.logInfo('$_loginKey key exists. jsonString: $tmpJson');
      if (tmpJson != null) {
        final model = LoginModel.fromJson(tmpJson);
        LoggerService.logInfo('$_loginKey key is NOT null. loginModel: $model');
        return model;
      }
    }
    LoggerService.logInfo('Reading completed. No loginModel in Shared');
    return null;
  }

  Future<bool> writeShared(LoginModel model, bool? isGoogle) async {
    LoggerService.logInfo('Starting to write Shared $model');
    final pref = await SharedPreferences.getInstance();
    bool b = await pref.setString(_loginKey, model.toJson());
    if(isGoogle != null) {
      await pref.setBool(_googleKey, isGoogle);
    }
    LoggerService.logInfo('Writing completed. success: $b');
    notifyListeners();
    return b;
  }

  Future<bool> writeOnboardShared(bool data) async {
    LoggerService.logInfo('Starting to write Shared $data');
    final pref = await SharedPreferences.getInstance();
    LoggerService.logInfo('writing Shared...');
    bool s = await pref.setBool(_onboardKey, data);
    LoggerService.logInfo('Writing completed. success: $s');
    notifyListeners();
    return s;
  }

  Future<User?> signInWithEmailAndPassWord(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if(user != null) {
        return user;
      }
      else {
        return null;
      }
    }
    catch(e) {
      LoggerService.logError(e.toString());
      rethrow;
    }
  }

  Future<User?> registerWithEmailAndPassword(String fullName, String email, String password, String phoneNumber) async {
    try {
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if(user != null) {
        await user.updateProfile(displayName: fullName);
        user = await signInWithEmailAndPassWord(email, password);
        await FirebaseService.createUser(user!.uid, fullName, email, phoneNumber);
        return user;
      }
      else {
        return null;
      }
    }
    catch(e) {
      LoggerService.logError(e.toString());
      return null;
    }
  }

  Future<bool> loginWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );
      
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? newUser = userCredential.user;

      if(userCredential.additionalUserInfo?.isNewUser ?? false) {
        await FirebaseService.createUser(newUser!.uid, newUser.displayName ?? '', newUser.email ?? '', newUser.phoneNumber ?? '');
      }
      user = newUser;
      isAdmin = await FirebaseService.getIsUserAdmin(user!.uid);
      notifyListeners();
      return true;
    }
    catch(e) {
      LoggerService.logError(e.toString());
      return false;
    }
  }

  Future<bool> _clearLogin() async {
    user = null;
    LoggerService.logInfo('Starting to clear login model in shared');
    final pref = await SharedPreferences.getInstance();
    bool b = await pref.remove(_loginKey);
    LoggerService.logInfo('Clear completed. success: $b');
    return b;
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await _clearLogin();
      notifyListeners();
    }
    catch(e) {
      print(e.toString());
    }
  }

  Future<String?> login(LoginModel model) async {
    final tmp = await signInWithEmailAndPassWord(model.email, model.password);
    if (tmp != null) {
      user = tmp;
      isAdmin = await FirebaseService.getIsUserAdmin(user!.uid);
      await writeShared(model, false);
      notifyListeners();
      return null;
    }
    return 'Kullanıcı Adı veya Şifre Hatalı';
  }

  Future<String?> register(String name, LoginModel model, String phoneNumber,) async {
    final tmp = await registerWithEmailAndPassword(name, model.email, model.password, phoneNumber);
    if (tmp != null) {
      user = tmp;
      isAdmin = await FirebaseService.getIsUserAdmin(user!.uid);
      await writeShared(model, false);
      notifyListeners();
      return null;
    }
    return 'Kullanıcı Adı veya Şifre Hatalı';
  }
}