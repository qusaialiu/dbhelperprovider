import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'note.dart';

class DbHelperProvider extends ChangeNotifier{
  late Database databace;
  List<Note> list =[];

  openDataBasefile() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes.db');
    databace = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE notes (id INTEGER PRIMARY KEY, msg TEXT)');
      },
    );
  }

  inserNote({required String msg}) async {
    await databace.rawInsert(
        "Insert into notes (msg) VALUES('$msg')");
    getAllNotes();
  }

  updateNote({required int id, required String msg}) async {
    await databace.rawUpdate(
        "Update notes set msg = '$msg' where id = $id");
    getAllNotes();
  }

  deleteNote({required int id,required int index}) async {
    await databace.rawDelete(
        "Delete From notes Where id = $id");
    list.removeAt(index);
    notifyListeners();

  }
  getAllNotes() async {
    list=[];
    List<Map> listMapNote = await databace.rawQuery("Select * From notes");
    for(Map i in listMapNote){
      list.add(Note(id: i["id"], msg: i["msg"]));
    }
   notifyListeners();
  }
}