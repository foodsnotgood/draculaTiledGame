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
    apiKey: 'AIzaSyD87EO9IJhkVgYKOn8F9qbymNjdJ7SyFLk',
    appId: '1:996038819421:web:575519709876d98ad297b4',
    messagingSenderId: '996038819421',
    projectId: 'dracula-rpg-game',
    authDomain: 'dracula-rpg-game.firebaseapp.com',
    storageBucket: 'dracula-rpg-game.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfq2odWlpfuMqUI7etaLhceVYJafdszpE',
    appId: '1:996038819421:android:44763a5d0762b986d297b4',
    messagingSenderId: '996038819421',
    projectId: 'dracula-rpg-game',
    storageBucket: 'dracula-rpg-game.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB86yKqrFWkN5Nkn6yW9wj2E_5lfAPCtbs',
    appId: '1:996038819421:ios:dd2a40b33308a400d297b4',
    messagingSenderId: '996038819421',
    projectId: 'dracula-rpg-game',
    storageBucket: 'dracula-rpg-game.appspot.com',
    iosClientId: '996038819421-b8flf26ma4ahhncfsnhaghh9b1j9jspq.apps.googleusercontent.com',
    iosBundleId: 'be.johannesroeder.draculaGame',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB86yKqrFWkN5Nkn6yW9wj2E_5lfAPCtbs',
    appId: '1:996038819421:ios:dd2a40b33308a400d297b4',
    messagingSenderId: '996038819421',
    projectId: 'dracula-rpg-game',
    storageBucket: 'dracula-rpg-game.appspot.com',
    iosClientId: '996038819421-b8flf26ma4ahhncfsnhaghh9b1j9jspq.apps.googleusercontent.com',
    iosBundleId: 'be.johannesroeder.draculaGame',
  );
}