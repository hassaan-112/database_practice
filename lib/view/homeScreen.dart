import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child:
          Obx(()=>ListView.builder(
                itemCount: authVM.users.length,
                itemBuilder:(context,index){
                  return ListTile(
                    title: Text(authVM.users[index].name!),
                    subtitle: Text(authVM.users[index].email!),
                    trailing: IconButton(onPressed: (){
                      authVM.deleteUser(authVM.users[index].email!);
                    }, icon: const Icon(Icons.delete)),
                  );

                }),
          ))
        ],
      ),
    );
  }
}
