import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_akademi/auth/router_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class N extends StatelessWidget {
  const N({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Home(),//
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF2196F3),
          scaffoldBackgroundColor: Color(0xFF1E88E3)),

      home: AnimatedSplashScreen(
          /* splash: Icons.access_alarm_rounded,*/
          splash: Image.asset('asset/focus_on_time_2.png'),
          duration: 3000,
          splashIconSize: 170,
          backgroundColor: Colors.blue,
          splashTransition: SplashTransition.rotationTransition,
          nextScreen: (((RouterPage())))),
    );
  }
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => (RouterPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
            Container(
              child: Text(
                'Splash Screen',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
