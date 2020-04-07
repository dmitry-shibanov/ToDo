import 'package:flutter/material.dart';

class ToDoContent extends StatelessWidget {


  int _id;
  ToDoContent.Db(int id){
    this._id = id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title of todo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => null,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
