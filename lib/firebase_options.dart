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
    apiKey: 'AIzaSyDyOUde7Kok797xgLt20QoscHWIUohLurk',
    appId: '1:919502501713:web:713cc0a1722f1442928570',
    messagingSenderId: '919502501713',
    projectId: 'travel-application-6335f',
    authDomain: 'travel-application-6335f.firebaseapp.com',
    storageBucket: 'travel-application-6335f.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlyCS2-hXNSb2gA_cKnixY0X3bCm5CYO0',
    appId: '1:919502501713:android:7da11305f1944828928570',
    messagingSenderId: '919502501713',
    projectId: 'travel-application-6335f',
    storageBucket: 'travel-application-6335f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBavvBoqstSxCtw810Lt6vsella0FjiwIc',
    appId: '1:919502501713:ios:6648635c4a981813928570',
    messagingSenderId: '919502501713',
    projectId: 'travel-application-6335f',
    storageBucket: 'travel-application-6335f.firebasestorage.app',
    iosBundleId: 'com.example.travelApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBavvBoqstSxCtw810Lt6vsella0FjiwIc',
    appId: '1:919502501713:ios:6648635c4a981813928570',
    messagingSenderId: '919502501713',
    projectId: 'travel-application-6335f',
    storageBucket: 'travel-application-6335f.firebasestorage.app',
    iosBundleId: 'com.example.travelApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDyOUde7Kok797xgLt20QoscHWIUohLurk',
    appId: '1:919502501713:web:fed6eaa308883d1a928570',
    messagingSenderId: '919502501713',
    projectId: 'travel-application-6335f',
    authDomain: 'travel-application-6335f.firebaseapp.com',
    storageBucket: 'travel-application-6335f.firebasestorage.app',
  );
}
