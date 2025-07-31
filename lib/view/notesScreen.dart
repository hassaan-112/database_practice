import 'package:database_practice/res/components/textFormFieldComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/User.dart';
import '../res/colors/appColors.dart';
import '../res/components/buttonComponent.dart';
import '../view_model/notesVM/notesVM.dart';
class NotesScreen extends StatefulWidget {
  NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final notesVM = Get.put(NotesVM());
  @override
  void initState() {
    super.initState();
    final widget = Get.arguments;
    notesVM.setUser(widget);
    notesVM.getNotes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
      ),
      body:  Center(
        child: Obx(()=>Column(
            children: [
              SizedBox(
                height: 500.h,
                child: ListView.builder(
                    itemCount: notesVM.notes.length,
                    itemBuilder: (context,index)
                    {
                      if(notesVM.isLoading.value){
                        return const CircularProgressIndicator();
                      }else{
                        return ListTile(title: Text(notesVM.notes[index].note!),leading:Text(notesVM.notes[index].id!.toString()),trailing: IconButton(onPressed: (){},icon: const Icon(Icons.delete)),);
                    }
                }),
              ),
              ButtonComponent(onPressed: (){
                Get.dialog(Card(
                  child: Column(
                    children: [Form(
                        key: notesVM.notesFormKey,
                        child: TextFormFieldComponent(hintText: "Enter text", controller: notesVM.noteController, keyboardType: TextInputType.text, focusNode: notesVM.focusNode, validator: (value){if(value!.isEmpty){return ("Please Enter Text");}return null;}, onSubmited:(value){notesVM.focusNode.unfocus();}, onTapedOutside: (v){notesVM.focusNode.unfocus();})),
                      ButtonComponent(onPressed: (){
                        notesVM.noteController.clear();
                        Get.back();
                        notesVM.addNote();
                      },text: "Add Note",textColor: AppColors.white,isLoading: notesVM.isLoading.value,),
                    ]
                  ),
                ));
              },text: "Add Note",textColor: AppColors.white,width: double.infinity,isLoading: notesVM.isLoading.value,),
              ButtonComponent(onPressed: (){
                notesVM.getallNotes();
              },text: "Get All Notes",textColor: AppColors.white,width: double.infinity,isLoading: notesVM.isLoading.value,),
            ],
          ),
        ),
      ),
    );
  }
}
