import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Student.dart';

class NewWidget extends StatelessWidget {
  final Student student;
  final Function delete;

  NewWidget(this.student, this.delete);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              student.name,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              student.surname,
              style: TextStyle(color: Colors.redAccent),
            ),
            FlatButton.icon(
                onPressed: delete,
                icon: Icon(Icons.delete),
                label: Text('DeleteStudents')),
          ],
        ),
      ),
    );
  }
}
