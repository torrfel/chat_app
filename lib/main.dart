import 'package:chat_app/interfaz/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDWOTP6z79WrrrdO5X23J0t-EsXsfogGJo",
      authDomain: "chatapp-6d85f.firebaseapp.com",
      projectId: "chatapp-6d85f",
      storageBucket: "chatapp-6d85f.appspot.com",
      messagingSenderId: "263080934066",
      appId: "1:263080934066:web:c2dc34b8d2f7f6e6fa67ab",
      measurementId: "G-6K2S6L1CDY"
    )
  );
  runApp(const MyApp());  
}

