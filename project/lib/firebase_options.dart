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
    apiKey: 'AIzaSyDcis_jHeb79O_hrzGpVyWCIz7Yisi9BYU',
    appId: '1:534162460776:web:15315cfad994c0572fabdd',
    messagingSenderId: '534162460776',
    projectId: 'borderrideshare',
    authDomain: 'borderrideshare.firebaseapp.com',
    storageBucket: 'borderrideshare.appspot.com',
    measurementId: 'G-HH2Y4KF08P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPhB2nT65HXWusfi9Jj0nIiHUM7yrgHrA',
    appId: '1:534162460776:android:30261d4accedc2dd2fabdd',
    messagingSenderId: '534162460776',
    projectId: 'borderrideshare',
    storageBucket: 'borderrideshare.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2QOtqW6tA18EffYuQE_jU1Mor2uGeDk8',
    appId: '1:534162460776:ios:5db115d5b769620f2fabdd',
    messagingSenderId: '534162460776',
    projectId: 'borderrideshare',
    storageBucket: 'borderrideshare.appspot.com'
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2QOtqW6tA18EffYuQE_jU1Mor2uGeDk8',
    appId: '1:534162460776:ios:5db115d5b769620f2fabdd',
    messagingSenderId: '534162460776',
    projectId: 'borderrideshare',
    storageBucket: 'borderrideshare.appspot.com'
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDcis_jHeb79O_hrzGpVyWCIz7Yisi9BYU',
    appId: '1:534162460776:web:83df38202571ef242fabdd',
    messagingSenderId: '534162460776',
    projectId: 'borderrideshare',
    authDomain: 'borderrideshare.firebaseapp.com',
    storageBucket: 'borderrideshare.appspot.com',
    measurementId: 'G-W7X410RSR1',
  );

}