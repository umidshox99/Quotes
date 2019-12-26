import 'package:flutter/material.dart';
import 'package:quotes2/Student.dart';

import 'StudentWidget.dart';

void main() => runApp(MaterialApp(
      home: Quotes(),
    ));

class Quotes extends StatefulWidget {
  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  List<Student> k = [
    Student('Umidjon1', 'Shoniyozov1'),
    Student('Umidjon2', 'Shoniyozov2'),
    Student('Umidjon3', 'Shoniyozov3'),
    Student('Umidjon4', 'Shoniyozov4'),
  ];

  showAlertDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget launchButton = FlatButton(
      child: Text("Launch missile"),
      onPressed: () {
        setState(() {
          k.add(Student(myControllerForName.text, myControllerForSurname.text));
          Navigator.pop(context);
        });
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add Student"),
      content: Container(
        height: 200.0,
        width: 200.0,
        child: Column(
          children: <Widget>[
            Text("Enter name and Surname"),
            TextField(
              controller: myControllerForName,
              decoration: InputDecoration(hintText: 'Enter name'),
            ),
            TextField(
              controller: myControllerForSurname,
              decoration: InputDecoration(hintText: 'Enter surname'),
            )
          ],
        ),
      ),
      actions: [
        cancelButton,
        launchButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final myControllerForName = TextEditingController();
  final myControllerForSurname = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerForName.dispose();
    myControllerForSurname.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome Quotes 2'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showAlertDialog(context);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: k
            .map((f) => NewWidget(f, () {
                  setState(() {
                    k.remove(f);
                  });
                }))
            .toList(),
      ),
    );
  }
}
