import 'package:flutter/material.dart';

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  late String input = " ";
  var mylist = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Notlar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontStyle: FontStyle.italic,
              letterSpacing: 5,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.blue,
            size: 35,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Not ekle"),
                    content: TextField(
                      decoration: InputDecoration(hintText: "Notunuz"),
                      onChanged: (String value) {
                        input = value;
                      },
                    ),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              mylist.add(input);
                            });
                            Navigator.of(context).pop;
                          },
                          child: Text(
                            "Ekle",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  );
                });
          },
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
              itemCount: mylist.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: Key(mylist[index]),
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        title: Text(
                          mylist[index],
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_forever_rounded,
                              color: Colors.red),
                          onPressed: () {
                            setState(() {
                              mylist.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ));
              }),
        ),
      ),
    );
  }
}
