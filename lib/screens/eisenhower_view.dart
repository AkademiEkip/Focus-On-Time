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
                        //style: ListTileStyle.list,
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
          const Divider(
            thickness: 2,
            height: 20,
            color: Colors.black,
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
                        title: Text(acilOnemliDegil[index].note.toString()),
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
    note = '';
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
                    if(note == ''){
                      Navigator.of(context).pop();
                    }else{
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
