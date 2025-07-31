import 'package:database_practice/database.dart';

class Notes{
  List<Note>? notes;
  Notes({this.notes});
  Notes.fromMap(List<Map<String,dynamic>> res){
    notes = <Note>[];
    res.forEach((e){
      notes?.add(Note.fromMap(e));
    });
  }
  List<Map<String,dynamic>> toMap(){
    List<Map<String,dynamic>> mp=[].cast<Map<String, dynamic>>();
    if(notes!=null){
      for (var e in notes!) {
        mp.add(e.toMap());
      }
    }
    return mp;

  }
}
class Note{
  int? id;
  String? title;
  String? description;
  Note({this.id,this.title,this.description});
  Note.fromMap(Map<String,dynamic> res){
    id =res[DBHelper.colId];
    title =res[DBHelper.colTitle];
    description =res[DBHelper.colDescription];
  }
  Map<String,Object?> toMap() {
    return {
      DBHelper.colTitle: title,
      DBHelper.colDescription: description
    };
  }
}