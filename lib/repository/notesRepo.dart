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
  Future<void> addNote({required String note,required String email})async{
    bool res = await _db.addNote(note: note, email: email);
    if(res){
      Utils.toast("Note Added back to repo", Colors.green);
    }else{
      Utils.toast("Note Not Added back to repo", Colors.red);
    }
  }

  Future<void> getallNotes()async{
    var res= await _db.getNote();
    print(res);

  }
}