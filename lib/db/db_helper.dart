import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/util/names.dart';



class TodoHelper {
  Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table ${TableNames.table} ( 
  ${TableNames.columnId} integer primary key autoincrement, 
  ${TableNames.columnTitle} text not null,
  ${TableNames.content} text,
  ${TableNames.pathImage} text)
''');
    });
  }

  Future<ToDo> insert(ToDo todo) async {
    todo.id = await db.insert(TableNames.table, todo.toMap());
    return todo;
  }

  Future<ToDo> getTodo(int id) async {
    List<Map> maps = await db.query(TableNames.table,
        where: '${TableNames.columnId} = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return ToDo.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(TableNames.table, where: '${TableNames.columnId} = ?', whereArgs: [id]);
  }

  Future<int> update(ToDo todo) async {
    return await db.update(TableNames.table, todo.toMap(),
        where: '${TableNames.columnId} = ?', whereArgs: [todo.id]);
  }

  Future close() async => db.close();
}