import 'package:todo_app/util/names.dart';

class ToDo{
  int _id;
  String _title;
  String _content;
  String _pathImage;

  int get id => _id;
  String get title => _title;
  String get content => _content;
  String get pathImage => _pathImage;

  set id(int key)=> this._id = key;


  ToDo.fromMap(Map<String, dynamic> map){
    _id = map[TableNames.columnId];
    _title = map[TableNames.columnTitle];
    _content = map[TableNames.content];
    _pathImage = map[TableNames.pathImage];
  }

  Map<String, dynamic> toMap(){
    Map<String,dynamic> map = {
      TableNames.columnTitle: _title,
      TableNames.content: _content?.isEmpty ? "Conetnt of ToDo" : _content,
      TableNames.pathImage: _pathImage?.isEmpty ? "" : _pathImage
    };

    if(_id!=null){
      map[TableNames.columnId] = _id;
    }
  }
}