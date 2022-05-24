import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_akademi/screens/home_view.dart';

import '../screens/eisenhower_view.dart';
import '../screens/home_page.dart';
import '../screens/profile_view.dart';
import 'auth_page.dart';

// yönlendirme sayfası - giriş yapıldı mı yapılmadı mı??
class RouterPage extends StatelessWidget {
  static String routeName = 'router';
  const RouterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return HomeView();
          }else{
            return AuthPage();
          }
        } ,
      ),
    );
  }
}
