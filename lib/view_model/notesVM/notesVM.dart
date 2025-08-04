import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../database/database.dart';
import '../../model/User.dart';
import '../../repository/notesRepo.dart';
import '../../utils/Utils.dart';

class NotesVM extends GetxController{
  final _notesRepo = NotesRepository();
  final notesFormKey = GlobalKey<FormState>();
  final noteController = TextEditingController();
  final focusNode = FocusNode();

  final loggedUser =User().obs;
  final notes = <Note>[].obs;
  final isLoading = false.obs;

  void setUser(User user){
    loggedUser.value=user;
  }

  Future<void> getNotes()async{
    isLoading.value=true;
    notes.value = await _notesRepo.getNotes(loggedUser.value.email!);
    isLoading.value=false;
    print(notes.length);
  }
  Future<void> addNote()async{
    if(notesFormKey.currentState!.validate()){
      await _notesRepo.adddNote(note: noteController.text, email: loggedUser.value.email!);
      await getNotes();
    }
    else{
      Utils.toast("Please Enter Text", Colors.red);
    }

  }

  Future<void> getallNotes()async{
    await _notesRepo.getallNotes();

  }

  Future<void> deleteNote(int id) async {
    await _notesRepo.deleteNote(id);
    await getNotes();
  }
}