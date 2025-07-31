import 'package:database_practice/res/colors/appColors.dart';
import 'package:database_practice/res/components/textFormFieldComponent.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../res/components/buttonComponent.dart';
import '../utils/Utils.dart';
import '../view_model/authViewModel/authVM.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final authVM = Get.put(AuthViewModel());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              SizedBox(
                height: 220.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    10.horizontalSpace,
                    Icon(Icons.login, color: Theme.of(context).primaryColor),
                  ],
                ),
              ),
              Center(
                child: Card(
                  elevation: 5,
                  color: Theme.of(context).cardColor,
                  child: Obx(
                        () => SizedBox(
                      height: 400.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Form(
                              key: authVM.fFormKey,
                              child: Column(
                                children: [
                                  TextFormFieldComponent(
                                    hintText: "Email",
                                    controller: authVM.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    focusNode: authVM.emailFocusNode,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please Enter Email");
                                      } else if (!EmailValidator.validate(value)){
                                        return ("Please Enter Valid Email");}
                                      return null;
                                    },
                                    onSubmited: (value) {
                                      Utils.fieldFocusChange(
                                        context,
                                        authVM.emailFocusNode,
                                        authVM.passwordFocusNode,
                                      );
                                    },
                                    onTapedOutside: (v) {
                                      authVM.emailFocusNode.unfocus();
                                    },
                                    autoFocus: false,
                                    suffixIcon: Icons.email,
                                  ),
                                  10.verticalSpace,
                                  TextFormFieldComponent(
                                    hintText: "Password",
                                    controller: authVM.passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    focusNode: authVM.passwordFocusNode,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please Enter Password");
                                      }
                                      return null;
                                    },
                                    onSubmited: (value) {
                                      Utils.fieldFocusChange(
                                        context,
                                        authVM.passwordFocusNode,
                                        authVM.confirmPasswordFocusNode,
                                      );
                                    },
                                    onTapedOutside: (v) {
                                      authVM.passwordFocusNode.unfocus();
                                    },
                                    autoFocus: false,
                                    obscureText: authVM.isPasswordVisible.value,
                                    suffixIcon: authVM.isPasswordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    suffixIconbuttonfunction: () {
                                      authVM.isPasswordVisible.value =
                                      !authVM.isPasswordVisible.value;
                                    },
                                  ),
                                  10.verticalSpace,
                                ],
                              ),
                            ),
                            30.verticalSpace,
                            ButtonComponent(
                              text: "Login",
                              onPressed: () async {
                                authVM.login();
                                // await authVM.getUsers();
                                // authVM.showUsers();
                              },
                              width: double.infinity,
                              textColor: AppColors.white,
                              isLoading: authVM.isLoading.value,
                            ),

                            TextButton(onPressed: (){
                              authVM.clearController();
                              Get.offAndToNamed("/");
                            }, child: Text("Signup Screen")),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
