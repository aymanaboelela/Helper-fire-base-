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
    apiKey: 'AIzaSyBCtxz1gTYhFAyEFuz1xJyrYbxIFOXjkDo',
    appId: '1:476770880706:web:00a9a137eb78706b6bff5b',
    messagingSenderId: '476770880706',
    projectId: 'helper-fire-bace',
    authDomain: 'helper-fire-bace.firebaseapp.com',
    storageBucket: 'helper-fire-bace.appspot.com',
    measurementId: 'G-DM91GVY8QL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAap3yZkXDtWgz5m9js2CG53kAJbZVmm3Y',
    appId: '1:476770880706:android:f8cfb865efd01ea26bff5b',
    messagingSenderId: '476770880706',
    projectId: 'helper-fire-bace',
    storageBucket: 'helper-fire-bace.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtp1-nrsRrqkpFqjHnDUQAdcjQgGzc2C0',
    appId: '1:476770880706:ios:0b8b0149b73e26046bff5b',
    messagingSenderId: '476770880706',
    projectId: 'helper-fire-bace',
    storageBucket: 'helper-fire-bace.appspot.com',
    iosBundleId: 'com.example.helperFireBace',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtp1-nrsRrqkpFqjHnDUQAdcjQgGzc2C0',
    appId: '1:476770880706:ios:efb326d66a730a9d6bff5b',
    messagingSenderId: '476770880706',
    projectId: 'helper-fire-bace',
    storageBucket: 'helper-fire-bace.appspot.com',
    iosBundleId: 'com.example.helperFireBace.RunnerTests',
  );
}
