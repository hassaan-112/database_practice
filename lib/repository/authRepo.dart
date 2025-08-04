import 'package:flutter/material.dart';

import '../database/database.dart';
import '../model/User.dart';
import '../utils/Utils.dart';

class AuthenticationRepository{
  final _db=DBHelper.getInstance;
  Future<void> addUser({required String email,required String name,required String password})async{
    bool res = await _db.insertUser(email: email, name: name, password: password);
    if(res) {
      Utils.toast("User Added", Colors.green);
    } else {
      Utils.toast("User Not Added", Colors.red);
    }
  }
  Future<List<User>> getUsers()async{
    var users= await _db.getAllUsers();
    return users.map((e) => User.fromMap(e)).toList();
  }
  Future<void> deleteById(String email) async {
    bool res = await _db.deleteById(email.toLowerCase());
    if(res) {
      Utils.toast("User Deleted", Colors.green);
    } else {
      Utils.toast("User Not Deleted", Colors.red);
    }
  }

}