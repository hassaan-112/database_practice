import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/User.dart';
import '../../repository/authRepo.dart';

class AuthViewModel extends GetxController{
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  RxList<User> users = <User>[].obs;


  final _authRepo = AuthenticationRepository();
  Future<void> signup() async {
    await getUsers();
    if(formKey.currentState!.validate()){
      Get.toNamed('/HomeScreen');
      // formKey.currentState!.save();
      isLoading.value = true;
      _authRepo.addUser(email: emailController.text, name: nameController.text, password: passwordController.text);
      isLoading.value = false;
      clearController();
      getUsers();
    }
  }

  Future<void> getUsers()async{
    users.value = await _authRepo.getUsers();
    update();
  }
  Future<void> deleteUser(String email)async{
    await _authRepo.deleteById(email);
    getUsers();
  }

  void clearController(){
    formKey.currentState!.reset();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    nameController.clear();

  }

  void showUsers(){
    print(users.length);
    for(var user in users){
      print(user.toMap());
    }
  }
}