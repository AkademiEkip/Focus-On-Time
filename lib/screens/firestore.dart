// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyFireStore extends StatefulWidget {
  const MyFireStore({Key? key}) : super(key: key);

  @override
  State<MyFireStore> createState() => _MyFireStoreState();
}

class _MyFireStoreState extends State<MyFireStore> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  String noteFromDb = "";
  String matrisFromDb = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () => noteSave(notes: ' notlar eklensin'),
            color: Colors.deepPurple[200],
            child: Text(
              "Veri ekle Note",
              style: TextStyle(fontSize: 17, color: Colors.grey[200]),
            ),
          ),
          MaterialButton(
            onPressed: () => matrisSave(matris: ' matris öncelikler eklensin'),
            color: Colors.deepPurple[200],
            child: Text(
              "Veri ekle Matris",
              style: TextStyle(fontSize: 17, color: Colors.grey[200]),
            ),
          ),
          MaterialButton(
            onPressed: () => removeNote(),
            color: Colors.deepPurple[200],
            child: Text(
              "Veri sil Note",
              style: TextStyle(fontSize: 17, color: Colors.grey[200]),
            ),
          ),
          MaterialButton(
            onPressed: () => removeMatris(),
            color: Colors.deepPurple[200],
            child: Text(
              "Veri sil Matris",
              style: TextStyle(fontSize: 17, color: Colors.grey[200]),
            ),
          ),
          MaterialButton(
            onPressed: () => noteFromDB(),
            color: Colors.deepPurple[200],
            child: Text(
              "Veritabanından note Getir",
              style: TextStyle(fontSize: 17, color: Colors.grey[200]),
            ),
          ),
          MaterialButton(
            onPressed: () => matrisFromDB(),
            color: Colors.deepPurple[200],
            child: Text(
              "Veritabanından matris Getir",
              style: TextStyle(fontSize: 17, color: Colors.grey[200]),
            ),
          ),

          ListTile(
           title: Text(noteFromDb),
           subtitle: Text(matrisFromDb), 
          ),
        ],
      )),
    );
  }


 // NOT : Yukarı da fonksiyonların nasıl kullanılacağı örneklendirildi. Kendi kodlarınıza ekleyebilirsiniz.
 // Sorunsuz bir şekilde veri tabanından veri çekerek önceki kaydedilen notları ekranınızda görebilirsiniz.
 // verileri ekleyip güncelleyebilirsiniz. ekleme ve güncelleme için aynı opsiyonu kullandım. 
 // save fonksiyonları ile kaydetip güncelleyebilirsiniz.
 // remove fonksiyonları ile silebilirsiniz.


  // not defteri not ekleme ve güncelleme
  Future<void> noteSave({notes}) async {
    await _firestore.collection('users').doc(user.uid).set(
      {'notes': notes},
      SetOptions(merge: true),
    );
  }
  
  // matris not ekleme ve güncelleme
  Future<void> matrisSave({matris}) async {
    await _firestore.collection('users').doc(user.uid).set(
      {'matris': matris},
      SetOptions(merge: true),
    );
  }
  
  // not defteri notları silme
  Future<void> removeNote() async {
    await _firestore.collection('users').doc(user.uid).set(
      {'notes': 'Veri yok' },
      SetOptions(merge: true),
    );
  }
 
  // matris notları getirme
  Future<void> removeMatris() async {
    await _firestore.collection('users').doc(user.uid).set(
      {'matris': 'Veri yok' },
      SetOptions(merge: true),
    );
  }

  // not defteri veri tabanından notları getirme
  Future<void> noteFromDB() async {
      await _firestore.collection('users').doc(user.uid).get().then((gelenVeri){
        setState(() {
            noteFromDb = gelenVeri.data()!['notes'];
        });
      });
  }

  // matris veri tabanından notları getirme
  Future<void> matrisFromDB() async {
      await _firestore.collection('users').doc(user.uid).get().then((gelenVeri){
        setState(() {
            matrisFromDb = gelenVeri.data()!['matris'];
        });
      });
  }
}
