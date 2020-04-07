import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingToDo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingToDoState();
  }
}

class SettingToDoState extends State<SettingToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Настройки"),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }

  Widget _itemBuidler(
      {@required BuildContext context,
      @required String title,
      @required Function func,
      @required IconData icon,
      String subtitle}) {
    subtitle ??= "";
    return ListTile(
      leading: Icon(icon),
      title: Text("Сортировка"),
      onTap: func,
      subtitle: Text(subtitle),
    );
  }
}
