import 'package:database_practice/res/routes/routeNames.dart';
import 'package:database_practice/view/homeScreen.dart';
import 'package:get/get.dart';

import '../../bindings/authbinding.dart';
import '../../view/images.dart';
import '../../view/loginScreen.dart';
import '../../view/notesScreen.dart';
import '../../view/signUp.dart';
class AppRoutes{
  AppRoutes._();

  static appRoutes()=>
      [
        GetPage(name: PageNames.signupScreen, page: ()=>SignupScreen(),binding: AuthBinding(),transition: Transition.fadeIn),
        GetPage(name: PageNames.homeScreen, page: ()=>HomeScreen(),binding: AuthBinding(),transition: Transition.fadeIn),
        GetPage(name: PageNames.loginScreen, page: ()=>LoginScreen(),binding: AuthBinding(),transition: Transition.fadeIn),
        GetPage(name: PageNames.notesScreen, page: ()=>NotesScreen(),binding: AuthBinding(),transition: Transition.fadeIn),
        GetPage(name: PageNames.imageScreen, page: ()=>ImageScreen(),binding: AuthBinding(),transition: Transition.fadeIn),
      ];
}