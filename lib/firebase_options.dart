// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDX3Gc-Zz7WVGH_dTywbBfRJ-SOWvi0AJY',
    appId: '1:272796033291:web:25be6b7d919d405e3c020e',
    messagingSenderId: '272796033291',
    projectId: 'chatapp-8c7ab',
    authDomain: 'chatapp-8c7ab.firebaseapp.com',
    storageBucket: 'chatapp-8c7ab.firebasestorage.app',
    measurementId: 'G-XGQCW1YDD0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD77KMeFXUcvna8xbiLNEVtgL3tftqAQjY',
    appId: '1:272796033291:android:349af7d6163c4f683c020e',
    messagingSenderId: '272796033291',
    projectId: 'chatapp-8c7ab',
    storageBucket: 'chatapp-8c7ab.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAw8vekaY-pYBg00af8yaj4DG6V5dUGpnM',
    appId: '1:272796033291:ios:3f8319ab9bce5daf3c020e',
    messagingSenderId: '272796033291',
    projectId: 'chatapp-8c7ab',
    storageBucket: 'chatapp-8c7ab.firebasestorage.app',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAw8vekaY-pYBg00af8yaj4DG6V5dUGpnM',
    appId: '1:272796033291:ios:3f8319ab9bce5daf3c020e',
    messagingSenderId: '272796033291',
    projectId: 'chatapp-8c7ab',
    storageBucket: 'chatapp-8c7ab.firebasestorage.app',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDX3Gc-Zz7WVGH_dTywbBfRJ-SOWvi0AJY',
    appId: '1:272796033291:web:d2b73a550a48c4af3c020e',
    messagingSenderId: '272796033291',
    projectId: 'chatapp-8c7ab',
    authDomain: 'chatapp-8c7ab.firebaseapp.com',
    storageBucket: 'chatapp-8c7ab.firebasestorage.app',
    measurementId: 'G-ZZTMHLWS8M',
  );
}
