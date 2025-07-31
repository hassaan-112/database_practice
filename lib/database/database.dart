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

  Database? myDB;

  Future<Database> getDB() async {
    myDB??=await openDB();
    return myDB!;

  }
  Future<Database> openDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path,'users.db');
    return await openDatabase(dbPath,version: 1,onCreate: (db,version){
      db.execute('CREATE TABLE $tableName($colEmail TEXT PRIMARY KEY,$colName TEXT,$colPassword TEXT)');
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
}