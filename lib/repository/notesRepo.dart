import 'package:flutter/material.dart';

import '../database/database.dart';
import '../model/User.dart';
import '../utils/Utils.dart';

class NotesRepository{
  final _db = DBHelper.getInstance;

  Future<List<Note>> getNotes(String email)async{
    var res= await _db.getAllNotes(email);
    return res.map((e) => Note.fromMap(e)).toList();
  }
  Future<void> adddNote({required String note,required String email})async{
    print("repo");
    bool res = await _db.addNote(note: note, email: email);
    if(res){
      Utils.toast("Note Added", Colors.green);
    }else{
      Utils.toast("Note Not Added", Colors.red);
    }
  }

  Future<void> getallNotes()async{
    var res= await _db.getNote();
    print(res);

  }
  Future<void> deleteNote(int id) async {
    bool res = await _db.deleteNote(id);
    if(res)
      Utils.toast("Note Deleted", Colors.green);
    else
      Utils.toast("Note Not Deleted", Colors.red);
  }

}