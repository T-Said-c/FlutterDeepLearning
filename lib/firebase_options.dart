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
    apiKey: 'AIzaSyAOAmnpz7z7wNkzslC4T46G6FNuMDLxMnQ',
    appId: '1:713167632012:web:7fd7705994983212132da9',
    messagingSenderId: '713167632012',
    projectId: 'flutterapp-e0ee2',
    authDomain: 'flutterapp-e0ee2.firebaseapp.com',
    storageBucket: 'flutterapp-e0ee2.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfp-_00WCkDEY8oZflZzPLz3htCMmdI6w',
    appId: '1:713167632012:android:8f822fe177d755ea132da9',
    messagingSenderId: '713167632012',
    projectId: 'flutterapp-e0ee2',
    storageBucket: 'flutterapp-e0ee2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZlpeDyNpJ0vGDJhqcg-eZRmXtXydK1s4',
    appId: '1:713167632012:ios:f09a21f01217f19a132da9',
    messagingSenderId: '713167632012',
    projectId: 'flutterapp-e0ee2',
    storageBucket: 'flutterapp-e0ee2.firebasestorage.app',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZlpeDyNpJ0vGDJhqcg-eZRmXtXydK1s4',
    appId: '1:713167632012:ios:f09a21f01217f19a132da9',
    messagingSenderId: '713167632012',
    projectId: 'flutterapp-e0ee2',
    storageBucket: 'flutterapp-e0ee2.firebasestorage.app',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAOAmnpz7z7wNkzslC4T46G6FNuMDLxMnQ',
    appId: '1:713167632012:web:791285bb62068b07132da9',
    messagingSenderId: '713167632012',
    projectId: 'flutterapp-e0ee2',
    authDomain: 'flutterapp-e0ee2.firebaseapp.com',
    storageBucket: 'flutterapp-e0ee2.firebasestorage.app',
  );

}