import 'package:get/get.dart';

import 'edit_work_controller.dart';

class EditWorkBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EditWorkController());
  }
}
