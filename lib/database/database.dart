import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../utils/Utils.dart';

class DBHelper{
  DBHelper._();
  static final DBHelper getInstance = DBHelper._();
  static final String tableName = 'user';
  static final String colEmail = 'email';
  static final String colName = 'name';
  static final String colPassword = 'password';

  static final String table2Name = 'notes';
  static final String colId = 'id';
  static final String colNote = 'note';

  Database? myDB;

  Future<Database> getDB() async {
    myDB??=await openDB();
    return myDB!;

  }
  Future<Database> openDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path,'users.db');
    return await openDatabase(dbPath,version: 1,onCreate: (db,version){
      db.execute('PRAGMA foreign_keys = ON');
      db.execute('CREATE TABLE $tableName($colEmail TEXT PRIMARY KEY,$colName TEXT,$colPassword TEXT)');
      db.execute('CREATE TABLE $table2Name($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colNote TEXT,$colEmail TEXT REFERENCES $tableName($colEmail))');

    });
  }
  //queries
  //add user

  Future<bool> insertUser({required String email,required String name,required String password})async{
    Database db = await getDB();
    int rowsAffected= await db.insert(tableName,{colEmail:email.toLowerCase(),colName:name,colPassword:password});
    Utils.toast("User Added", Colors.green);
    return rowsAffected>0;
  }

  //getAll
  Future<List<Map<String,dynamic>>> getAllUsers()async{
    Database db =await getDB();
    List<Map<String,dynamic>> users = await db.query(tableName);
    return users;
  }

  //delete one
  Future<bool> deleteById(String email) async {
    Database db =await getDB();
    int a =await db.delete(tableName,where:'$colEmail=?',whereArgs: [email]);
    return a>0;
  }

  Future<bool> addNote({required String note,required String email})async{
    Database db = await getDB();
    int rowsAffected= await db.insert(table2Name,{colNote:note,colEmail:email});
    Utils.toast("Note Added", Colors.green);
    return rowsAffected>0;
  }

  Future<List<Map<String,dynamic>>> getAllNotes(String email)async{
    Database db =await getDB();
    List<Map<String,dynamic>> notes = await db.query(table2Name,where:'$colEmail=?',whereArgs: [email]);
    return notes;
  }
  Future<List<Map<String,dynamic>>> getNote()async{
    Database db =await getDB();
    List<Map<String,dynamic>> notes = await db.query(table2Name);
    return notes;
  }

  Future<bool> deleteNote(int id) async {
    Database db =await getDB();
    int a =await db.delete(table2Name,where:'$colId=?',whereArgs: [id]);
    return a>0;
  }

}