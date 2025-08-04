import 'package:get/get.dart';
import '../view_model/authViewModel/authVM.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthViewModel(), permanent: true);
  }
}
