import 'package:get/instance_manager.dart';
import 'package:project_one/screens/user_home/user_home_controller.dart';

class UserHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserHomeController());
  }
}
