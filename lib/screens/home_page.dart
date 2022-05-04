import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


// ana sayfa - giriş yaptıktan sonra karşımıza çıkacak sayfa
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Signed in, welcome " + user.email!,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.deepPurple[200],
            child: Text(
              "Sign Out",
              style: TextStyle(fontSize: 17, color: Colors.grey[200]),
            ),
          )
        ],
      )),
    );
  }
}
