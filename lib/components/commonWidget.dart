import 'package:flutter/material.dart';

class CommonToDo {
    Widget itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Icon(Icons.ac_unit),
            ),
            Flexible(
              flex: 3,
              child: Text('title'),
            )
          ],
        ),
      ),
      onTap: () => Navigator.pushNamed<bool>(context, '/todo/1'),
    );
  }
}