import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_akademi/auth/auth_page.dart';
import 'package:project_akademi/screens/timer_page.dart';
import 'admob.dart';
import 'auth/router_page.dart';
import 'firebase_options.dart';
import 'screens/method_desc_page.dart';


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

