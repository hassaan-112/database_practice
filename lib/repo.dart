import 'package:database_practice/database.dart';
import 'package:database_practice/model.dart';

class repo{


  Future<Notes> getAll()async{

    List<Map<String,dynamic>> notes = await DBHelper.getInstance.getAllNotes();
      return Notes.fromMap(notes);
  }




  Future<void> addOne(Note n)async{
    await DBHelper.getInstance.insertNote2(n) ;
  }
}