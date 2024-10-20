import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCsBaIQZNxIkHU35CSRYR_6whz9MpK38aw",
            authDomain: "mokata3a-d5142.firebaseapp.com",
            projectId: "mokata3a-d5142",
            storageBucket: "mokata3a-d5142.appspot.com",
            messagingSenderId: "1048526094759",
            appId: "1:1048526094759:web:2a8dd5ae40a8457ceaf682"));
  } else {
    await Firebase.initializeApp();
  }
}
