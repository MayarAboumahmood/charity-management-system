import 'package:get/instance_manager.dart';
import 'package:project_one/screens/Add_pages/add_work/add_work_controller.dart';

class AddWorkBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddWorkController());
  }
}
