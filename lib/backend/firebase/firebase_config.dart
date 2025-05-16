import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAymClHgylOtip3dktrkapWtwPk0twZA3U",
            authDomain: "ecommunity-awspik.firebaseapp.com",
            projectId: "ecommunity-awspik",
            storageBucket: "ecommunity-awspik.appspot.com",
            messagingSenderId: "641079364407",
            appId: "1:641079364407:web:3b556ddc6dc9e99d47a8b2"));
  } else {
    await Firebase.initializeApp();
  }
}
