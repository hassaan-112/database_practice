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
        child: Obx(()=>Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
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
                          return Card(child: ListTile(title: Text(notesVM.notes[index].note!),leading:Text(notesVM.notes[index].id!.toString()),trailing: IconButton(onPressed: (){notesVM.deleteNote(notesVM.notes[index].id!);},icon: const Icon(Icons.delete)),));
                      }
                  }),
                ),
                ButtonComponent(onPressed: (){

                  Get.dialog(Dialog(

                    child: SizedBox(
                      height: 200.h,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.w),
                        child: Column(
                          children: [
                            Form(
                              key: notesVM.notesFormKey,
                              child: TextFormFieldComponent(hintText: "Enter text", controller: notesVM.noteController, keyboardType: TextInputType.text, focusNode: notesVM.focusNode, validator: (value){if(value!.isEmpty){return ("Please Enter Text");}return null;}, onSubmited:(value){notesVM.focusNode.unfocus();}, onTapedOutside: (v){notesVM.focusNode.unfocus();})),
                            10.verticalSpace,
                            ButtonComponent(onPressed: ()async{
                              Get.back();
                              await notesVM.addNote();
                              notesVM.noteController.clear();
                            },text: "Add Note",textColor: AppColors.white,isLoading: notesVM.isLoading.value,),
                          ]
                        ),
                      ),
                    ),
                  ));
                },text: "Add Note",textColor: AppColors.white,width: double.infinity,isLoading: notesVM.isLoading.value,),
              ],
            ),
        ),
        ),
      ),
    );
  }
}
