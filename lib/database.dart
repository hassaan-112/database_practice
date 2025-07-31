import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'model.dart';

class DBHelper{

  DBHelper._();

  static final DBHelper getInstance = DBHelper._();
  static final String tableName = 'note';
  static final String colId = 'id';
  static final String colTitle = 'title';
  static final String colDescription = 'description';

  Database? myDB;

  Future<Database> getDB() async {
    myDB??=await openDB();
    return myDB!;
  }

  Future<Database> openDB() async {

    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path,'notes.db');

    return await openDatabase(dbPath,version: 1,onCreate: (db,version){
      db.execute('CREATE TABLE $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,$colDescription TEXT)');

    });


  }

  //queries
  //insert

  Future<bool> insertNote({required String title,required String description})async{
    Database db = await getDB();
    int rowsAffected= await db.insert(tableName,{colTitle:title,colDescription:description});
    return rowsAffected>0;
  }


  // get all
  Future<List<Map<String,dynamic>>> getAllNotes()async{

    Database db =await getDB();
    // custom query to fetch required columns
    // List<Map<String,dynamic>> notes = await db.query(tableName,columns: [colId,colTitle,colDescription]);

    // query to fetch all tables columns
    List<Map<String,dynamic>> notes = await db.query(tableName);
    return notes;

  }

  //delete with id
  Future<bool> deleteNote({required int id})async{

    Database db = await getDB();
    int rowsAffected = await db.delete(tableName,where: '$colId=?',whereArgs: [id]);
    return rowsAffected>0;
  }


  Future<bool> insertNote2(Note n)async{
    Database db = await getDB();
    int rowsAffected= await db.insert(tableName,n.toMap());
    return rowsAffected>0;
  }



}