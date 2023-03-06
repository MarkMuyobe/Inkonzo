import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD8yINqFI20E5UdhKoHjpoyvAPAUVD8TbQ",
            authDomain: "inkonzoapp.firebaseapp.com",
            projectId: "inkonzoapp",
            storageBucket: "inkonzoapp.appspot.com",
            messagingSenderId: "260836686167",
            appId: "1:260836686167:web:e8fd048ef0dc43c5aa6612",
            measurementId: "G-8ZG37R84K3"));
  } else {
    await Firebase.initializeApp();
  }
}
