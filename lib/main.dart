import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/pages/content_page.dart';
import 'package:todo_app/util/custom_route.dart';

import 'db/db_helper.dart';
import 'model/todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ToDo'),
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'todo') {
          final int index = int.parse(pathElements[2]);
          return CustomRoute<bool>(
              builder: (BuildContext context) =>
                  ToDoContent.Db(index));
        }
        return null;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        setState(() {
          //"reached the bottom";
        });
      }
      if (_controller.offset <= _controller.position.minScrollExtent &&
          !_controller.position.outOfRange) {
        setState(() {
          //"reached the top";
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Key _indicator = new Key("progressIndicator");
    // var databasesPath = await getDatabasesPath();
    // String path = String.join(databasesPath, 'demo.db');
    TodoHelper helper = TodoHelper();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: 12,
        itemBuilder: _itemBuilder,
      ),
      // body: StreamBuilder(
      //   stream: Stream.fromFuture(helper.open(getApplication)),
      //   builder: (BuildContext context, AsyncSnapshot<ToDo> snapshot) {
      //     if (snapshot.hasData) {
      //       return ListView.builder(itemCount: 12, itemBuilder: _itemBuilder);
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(
      //           key: _indicator,
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
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
