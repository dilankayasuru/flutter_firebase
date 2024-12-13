// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDqCg9STbQb2QldlxCVjtKONqs0lVNyumo',
    appId: '1:555859990090:web:028deec47677363aa0b8b3',
    messagingSenderId: '555859990090',
    projectId: 'madapp-2c289',
    authDomain: 'madapp-2c289.firebaseapp.com',
    storageBucket: 'madapp-2c289.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmaSCk1Um77PgJQQbdtcdrj3UpI3XfAjA',
    appId: '1:555859990090:android:6f8f02b6a33e4553a0b8b3',
    messagingSenderId: '555859990090',
    projectId: 'madapp-2c289',
    storageBucket: 'madapp-2c289.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdEh08VDrEhVTDuX8N6ggEX2y3090EVZk',
    appId: '1:555859990090:ios:e4e4f9e2ed10b3bea0b8b3',
    messagingSenderId: '555859990090',
    projectId: 'madapp-2c289',
    storageBucket: 'madapp-2c289.firebasestorage.app',
    iosBundleId: 'com.example.firebaseTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdEh08VDrEhVTDuX8N6ggEX2y3090EVZk',
    appId: '1:555859990090:ios:e4e4f9e2ed10b3bea0b8b3',
    messagingSenderId: '555859990090',
    projectId: 'madapp-2c289',
    storageBucket: 'madapp-2c289.firebasestorage.app',
    iosBundleId: 'com.example.firebaseTest',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDqCg9STbQb2QldlxCVjtKONqs0lVNyumo',
    appId: '1:555859990090:web:5e96197b9d046330a0b8b3',
    messagingSenderId: '555859990090',
    projectId: 'madapp-2c289',
    authDomain: 'madapp-2c289.firebaseapp.com',
    storageBucket: 'madapp-2c289.firebasestorage.app',
  );

}