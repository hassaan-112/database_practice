import 'package:database_practice/res/routes/routeNames.dart';
import 'package:database_practice/view/homeScreen.dart';
import 'package:get/get.dart';

import '../../view/signUp.dart';
class AppRoutes{
  AppRoutes._();

  static appRoutes()=>
      [
        GetPage(name: PageNames.loginScreen, page: ()=>SignupScreen(),transition: Transition.fadeIn),
        GetPage(name: PageNames.homeScreen, page: ()=>HomeScreen(),transition: Transition.fadeIn)
      ];
}