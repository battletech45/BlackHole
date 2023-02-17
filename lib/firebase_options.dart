// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA1Syr8zvkoYZH6iPQ-YDTVvkmhJaF6mSE',
    appId: '1:207119378431:web:e07e4ee1fa3d0a171929ca',
    messagingSenderId: '207119378431',
    projectId: 'blackholecafe-d6622',
    authDomain: 'blackholecafe-d6622.firebaseapp.com',
    storageBucket: 'blackholecafe-d6622.appspot.com',
    measurementId: 'G-HZQTYWXHW9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAOdrKBfhqJLK037rk2Q5TLIX6SbAhN7g',
    appId: '1:207119378431:android:0538fec751beb8651929ca',
    messagingSenderId: '207119378431',
    projectId: 'blackholecafe-d6622',
    storageBucket: 'blackholecafe-d6622.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSs6xd2ixI4CNAtm51ZdQBwTlSCzwdSNU',
    appId: '1:207119378431:ios:abf1a00e3d843cf91929ca',
    messagingSenderId: '207119378431',
    projectId: 'blackholecafe-d6622',
    storageBucket: 'blackholecafe-d6622.appspot.com',
    androidClientId: '207119378431-n5uga18vtgon6hnd4h8c3bdmgc2027g1.apps.googleusercontent.com',
    iosClientId: '207119378431-5qmru5slr5chh969aq859tl5qrnj5cpo.apps.googleusercontent.com',
    iosBundleId: 'com.example.blackHole',
  );
}
