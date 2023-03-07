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
    apiKey: 'AIzaSyBc9-GDU-ZheAE6XBODWbliWq_VPUKQHV4',
    appId: '1:960546930649:web:f59ad96bc7f0d87e1ae3c8',
    messagingSenderId: '960546930649',
    projectId: 'primeiro-projeto-dpm',
    authDomain: 'primeiro-projeto-dpm.firebaseapp.com',
    storageBucket: 'primeiro-projeto-dpm.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAi54KWNMRrxy8xkuf6wv_mlpJt5elNmts',
    appId: '1:960546930649:android:cb5fd3e00b0fd21d1ae3c8',
    messagingSenderId: '960546930649',
    projectId: 'primeiro-projeto-dpm',
    storageBucket: 'primeiro-projeto-dpm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfiuAY-bJa_wSDh1ARbwPjhMkzwXxCZys',
    appId: '1:960546930649:ios:3420875e343ce1c11ae3c8',
    messagingSenderId: '960546930649',
    projectId: 'primeiro-projeto-dpm',
    storageBucket: 'primeiro-projeto-dpm.appspot.com',
    iosClientId: '960546930649-s5es82sfhms9vko893qlebcaul0o638n.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfiuAY-bJa_wSDh1ARbwPjhMkzwXxCZys',
    appId: '1:960546930649:ios:3420875e343ce1c11ae3c8',
    messagingSenderId: '960546930649',
    projectId: 'primeiro-projeto-dpm',
    storageBucket: 'primeiro-projeto-dpm.appspot.com',
    iosClientId: '960546930649-s5es82sfhms9vko893qlebcaul0o638n.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseCrud',
  );
}
