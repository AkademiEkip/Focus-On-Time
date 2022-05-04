import 'package:flutter/material.dart';
import 'package:project_akademi/screens/login_page.dart';
import '../screens/register_page.dart';


// kontrol sayfası - Login page ve Register page dönüşümünü kontrol eden yapı
class AuthPage extends StatefulWidget {
  const AuthPage({ Key? key }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(showRegisterPage: toggleScreens);
    }else{
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}