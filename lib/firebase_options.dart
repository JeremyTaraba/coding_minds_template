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
    apiKey: 'AIzaSyCxrsvLzpHu0o63dk9BCcyWHDh2wRDA1-o',
    appId: '1:300152250651:web:e91ae2f68664a3e0d4b3be',
    messagingSenderId: '300152250651',
    projectId: 'counseling-app-e18d8',
    authDomain: 'counseling-app-e18d8.firebaseapp.com',
    storageBucket: 'counseling-app-e18d8.appspot.com',
    measurementId: 'G-M82PJRXD55',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDx_awyiXR18mS1oBc3tS9lpUthD2MF5KA',
    appId: '1:300152250651:android:3854f460ba0db192d4b3be',
    messagingSenderId: '300152250651',
    projectId: 'counseling-app-e18d8',
    storageBucket: 'counseling-app-e18d8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtAWZOfR-ET3ajo95BYNke_rUPiiMTIXg',
    appId: '1:300152250651:ios:f766690e1724415fd4b3be',
    messagingSenderId: '300152250651',
    projectId: 'counseling-app-e18d8',
    storageBucket: 'counseling-app-e18d8.appspot.com',
    iosBundleId: 'cm.codingmindstemplate',
  );
}
