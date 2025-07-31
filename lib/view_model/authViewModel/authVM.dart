import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/User.dart';
import '../../repository/authRepo.dart';
import '../../utils/Utils.dart';

class AuthViewModel extends GetxController{
  final sFormKey = GlobalKey<FormState>();
  final fFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  Rx<User> loggedUser = User().obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  RxList<User> users = <User>[].obs;


  final _authRepo = AuthenticationRepository();
  Future<void> signup() async {
    await getUsers();
    if(sFormKey.currentState!.validate()){
      loggedUser.value = User(name: nameController.text, email: emailController.text, password: passwordController.text);
      Get.toNamed('/HomeScreen');
      // formKey.currentState!.save();
      isLoading.value = true;
      _authRepo.addUser(email: emailController.text, name: nameController.text, password: passwordController.text);
      isLoading.value = false;
      clearController();
      getUsers();
    }
  }

  Future<void> login() async {
    await getUsers();
    if(fFormKey.currentState!.validate()){
      loggedUser.value = User(email: emailController.text, password: passwordController.text);
      for(var user in users){
        if(user.email==emailController.text && user.password==passwordController.text){
          Get.toNamed('/HomeScreen');
          clearController();
          break;
        }else{
          Utils.toast("Invalid Email or Password", Colors.red);
        }
      }
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