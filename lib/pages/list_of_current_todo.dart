import 'package:flutter/material.dart';
import 'package:todo_app/components/commonWidget.dart';

class CurrentToDo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

class CurrentToDoState extends State<CurrentToDo> with CommonToDo {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: itemBuilder,
      itemCount: 20,
    );
  }
}
