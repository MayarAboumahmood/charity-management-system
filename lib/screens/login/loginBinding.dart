import 'package:get/get.dart';
import 'loginconrtoller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
