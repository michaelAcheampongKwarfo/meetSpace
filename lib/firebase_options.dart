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
        return macos;
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
    apiKey: 'AIzaSyBhcYrSbW92n57URt31X6rUhN7AFp81Hr0',
    appId: '1:936475195804:web:427d8c0973c73c0b5bf059',
    messagingSenderId: '936475195804',
    projectId: 'meetspaceapp',
    authDomain: 'meetspaceapp.firebaseapp.com',
    storageBucket: 'meetspaceapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCal6Wv0cjZrVNLflcdNp93FohFfZt7sws',
    appId: '1:936475195804:android:1fe42d50e366c11e5bf059',
    messagingSenderId: '936475195804',
    projectId: 'meetspaceapp',
    storageBucket: 'meetspaceapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5x3roKdn66Srw3cPAJ1UqcgdHceJ1hxo',
    appId: '1:936475195804:ios:d720f14eaa007dd45bf059',
    messagingSenderId: '936475195804',
    projectId: 'meetspaceapp',
    storageBucket: 'meetspaceapp.appspot.com',
    iosBundleId: 'com.example.meetSpace',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5x3roKdn66Srw3cPAJ1UqcgdHceJ1hxo',
    appId: '1:936475195804:ios:71bb603fcac5d9635bf059',
    messagingSenderId: '936475195804',
    projectId: 'meetspaceapp',
    storageBucket: 'meetspaceapp.appspot.com',
    iosBundleId: 'com.example.meetSpace.RunnerTests',
  );
}
