import 'package:flutter/material.dart';
import 'package:todo_app/mixins/create_mixin.dart';

class CreateToDo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateToDoState();
  }
}

class _CreateToDoState extends State with CreateMixin {
  Widget buildTitle([String title = ""]) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Text("Title"),
        ),
        Flexible(
          flex: 3,
          child: TextFormField(
            initialValue: title,
            validator: validateTitle,
          ),
        )
      ],
    );
  }

  Widget buildContent([String content = ""]) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Text("Content"),
        ),
        Flexible(
          flex: 3,
          child: TextFormField(
            initialValue: content,
            validator: validateContent,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create ToDo"),
        ),
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment(0, 0.9),
            children: <Widget>[
              ListView(
                children: <Widget>[buildTitle(), buildContent()],
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height / 2)),
                child: Text("Save"),
                onPressed: () => null,
              )
            ],
          ),
        ));
  }
}
