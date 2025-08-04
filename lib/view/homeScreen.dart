import 'package:database_practice/res/components/buttonComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../res/colors/appColors.dart';
import '../view_model/authViewModel/authVM.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authVM = Get.put(AuthViewModel());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: 500.h,
                child:
            Obx(()=>ListView.builder(
                  itemCount: authVM.users.length,
                  itemBuilder:(context,index){
                    return Card(
                      child: ListTile(
                        title: Text(authVM.users[index].name!),
                        subtitle: Text(authVM.users[index].email!),
                        trailing: IconButton(onPressed: (){
                          authVM.deleteUser(authVM.users[index].email!);
                        }, icon: const Icon(Icons.delete)),
                      ),
                    );

                  }),
            )),
            ButtonComponent(onPressed: (){
              Get.toNamed("/NotesScreen",arguments: authVM.loggedUser.value);
            },text: "Notes Screen",textColor: AppColors.white,width: double.infinity,),
            20.verticalSpace,
            ButtonComponent(onPressed: (){

            },text: "Image Screen",textColor: AppColors.white,width: double.infinity,),
          ],
        ),
      ),
    );
  }
}
