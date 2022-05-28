import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'admob.dart';
import 'auth/router_page.dart';
import 'firebase_options.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.admobInitialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RouterPage(),
    );
  }
}
