import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCVJ8R4rAgfPGURTIeiQ7IeCoX_p8-dJUU",
            authDomain: "parroquiainmaculada-671ed.firebaseapp.com",
            projectId: "parroquiainmaculada-671ed",
            storageBucket: "parroquiainmaculada-671ed.appspot.com",
            messagingSenderId: "142797800769",
            appId: "1:142797800769:web:6e6cef95648fd0d40dcdc0"));
  } else {
    await Firebase.initializeApp();
  }
}
