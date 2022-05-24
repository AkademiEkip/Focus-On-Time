import 'package:flutter/material.dart';
import '../constant.dart';
import '../note.dart';

class EisenhowerView extends StatefulWidget {
  const EisenhowerView({Key? key}) : super(key: key);

  static String routeName = 'eisenhower';

  @override
  State<EisenhowerView> createState() => _EisenhowerViewState();
}

List<Note> acilOnemli = [];
List<Note> acilOnemliDegil = [];
List<Note> onemliAcilDegil = [];
List<Note> acilVeOnemliDegil = [];

class _EisenhowerViewState extends State<EisenhowerView> {
  int silinecekIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eisenhower Matrisi'),
        actions: [
          IconButton(
              onPressed: () {
                //createAlertDialog(context, acilOnemli);
                // setState(() {
                //   showDialog(
                //       context: context,
                //       builder: (context) {
                //         return MyStatefulWidget();
                //       });
                //   acilOnemli;
                // });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  createAlertDialog(context, acilOnemli);
                },
                child: Text(
                  'ACİL ÖNEMLİ',
                  style: TextStyle(
                      color: eisenHowerColors[0],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  createAlertDialog(context, onemliAcilDegil);
                },
                child: Text(
                  'ÖNEMLİ ACİL DEĞİL',
                  style: TextStyle(
                      color: eisenHowerColors[1],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: acilOnemli.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(acilOnemli[index].note.toString()),
                        onTap: (){
                          silinecekIndex = index;
                          deleteNoteDialog(context, acilOnemli, index);
                        },
                      );
                        acilOnemli[index];
                    },
                  ),
                  //ListView(
                  //   children: [
                  //     ListTile(
                  //         title: const Text('Matematik ders notlarını çıkart'),
                  //         onTap: () {}),
                  //     ListTile(
                  //         title: const Text(
                  //             'Öğlen 12\'ye kadar proje teslim mailini gönder'),
                  //         onTap: () {}),
                  //     ListTile(
                  //         title: const Text(
                  //             'Öğleden sonraki acil toplantı için rapor hazırla'),
                  //         onTap: () {}),
                  //     ListTile(
                  //         title: const Text('Önemli mailleri cevapla'), onTap: () {}),
                  //   ],
                  // ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: onemliAcilDegil.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(onemliAcilDegil[index].note.toString()),
                        onTap: (){
                          print(index);
                          deleteNoteDialog(context, onemliAcilDegil, index);
                          //acilOnemli[index].function;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  createAlertDialog(context, acilOnemliDegil);
                },
                child: Text(
                  'ACİL ÖNEMLİ DEĞİL',
                  style: TextStyle(
                      color: eisenHowerColors[2],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  createAlertDialog(context, acilVeOnemliDegil);
                },
                child: Text(
                  'ACİL VE ÖNEMLİ DEĞİL',
                  style: TextStyle(
                      color: eisenHowerColors[3],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: acilOnemliDegil.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(acilOnemli[index].note.toString()),
                        onTap: (){
                          deleteNoteDialog(context, acilOnemliDegil, index);
                          //acilOnemli[index].function;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: acilVeOnemliDegil.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(acilVeOnemliDegil[index].note.toString()),
                        onTap: (){
                          deleteNoteDialog(context, acilVeOnemliDegil, index);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String? note = '';

  createAlertDialog(BuildContext context, List list) {
    return showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: const Text('Notunuz: '),
            content: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    note = value;
                  },
                ),
              ],
            ),
            actions: [
              MaterialButton(
                elevation: 5.0,
                child: const Text('Kaydet'),
                onPressed: () {
                  setState(() {
                    Note not = Note();
                    not.note = note!;
                    //not.function = createAlertDialog(context, list);
                    list.add(
                        not
                    );
                    Navigator.of(context).pop();
                  });
                }
              ),

            ],
          ),
        );
      },
    );
  }

  deleteNoteDialog(BuildContext context, List list, int index) {
    return showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: const Text('SİL'),
            content: const Text('Notu silmek istediğinize emin misiniz ?'),
            actions: [
              MaterialButton(
                  elevation: 5.0,
                  child: const Text('Vazgeç'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
              ),
              MaterialButton(
                  elevation: 5.0,
                  child: const Text('SİL'),
                  onPressed: () {
                    setState(() {
                      list.removeAt(index);
                      Navigator.of(context).pop();
                    });
                  }
              ),
            ],
          ),
        );
      },
    );
  }
}

// enum SingingCharacter { bir, iki, uc, dort }
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   SingingCharacter? _character = SingingCharacter.bir;
//   String? note;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: AlertDialog(
//         title: const Text('Notunuz: '),
//         content: Column(
//           children: [
//             TextField(
//               onChanged: (value) {
//                 note = value;
//               },
//             ),
//             ListTile(
//               title: const Text('ACİL ÖNEMLİ'),
//               leading: Radio<SingingCharacter>(
//                 value: SingingCharacter.bir,
//                 groupValue: _character,
//                 onChanged: (SingingCharacter? value) {
//                   setState(() {
//                     _character = value;
//                   });
//                 },
//               ),
//             ),
//             ListTile(
//               title: const Text('ACİL ÖNEMLİ DEĞİL'),
//               leading: Radio<SingingCharacter>(
//                 value: SingingCharacter.iki,
//                 groupValue: _character,
//                 onChanged: (SingingCharacter? value) {
//                   setState(() {
//                     _character = value;
//                   });
//                 },
//               ),
//             ),
//             ListTile(
//               title: const Text('ÖNEMLİ ACİL DEĞİL'),
//               leading: Radio<SingingCharacter>(
//                 value: SingingCharacter.uc,
//                 groupValue: _character,
//                 onChanged: (SingingCharacter? value) {
//                   setState(() {
//                     _character = value;
//                   });
//                 },
//               ),
//             ),
//             ListTile(
//               title: const Text('ACİL VE ÖNEMLİ DEĞİL'),
//               leading: Radio<SingingCharacter>(
//                 value: SingingCharacter.dort,
//                 groupValue: _character,
//                 onChanged: (SingingCharacter? value) {
//                   setState(() {
//                     _character = value;
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           MaterialButton(
//             elevation: 5.0,
//             child: const Text('Kaydet'),
//             onPressed: () {
//               setState(() {
//                 if (_character == SingingCharacter.bir) {
//                   setState(() {
//                     acilOnemli.add(
//                       ListTile(title: Text(note!), onTap: () {}),
//                     );
//                   });
//                 } else if (_character == SingingCharacter.iki) {
//                 } else if (_character == SingingCharacter.uc) {
//                 } else {}
//               });
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:emircan/constant.dart';
// import 'package:flutter/material.dart';
//
// class EisenhowerView extends StatefulWidget {
//   const EisenhowerView({Key? key}) : super(key: key);
//   static String routeName = 'eisenhower';
//
//   @override
//   State<EisenhowerView> createState() => _EisenhowerViewState();
// }
//
// class _EisenhowerViewState extends State<EisenhowerView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Eisenhower Matrisi"),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             margin: EdgeInsets.all(20),
//             child: Table(
//               //defaultColumnWidth: FixedColumnWidth(120.0),
//               border: TableBorder.all(
//                   color: Colors.black, style: BorderStyle.solid, width: 2),
//               children: [
//                 TableRow( children: [
//                   Text('Website', style: TextStyle(fontSize: 20.0)),
//                   Text('Tutoridsadadsadsadsadsadsaal', style: TextStyle(fontSize: 20.0)),
//                 ]),
//                 TableRow( children: [
//                   Text('Website', style: TextStyle(fontSize: 20.0)),
//                   Text('Tutorial', style: TextStyle(fontSize: 20.0)),
//                 ]),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
