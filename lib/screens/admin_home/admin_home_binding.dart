import 'package:get/instance_manager.dart';
import 'admin_controller.dart';

class AdminHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AdminHomeController());
    // TODO: implement dependencies
  }
}
