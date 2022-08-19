import 'package:get/get.dart';

import 'add_scolarship_controller.dart';

class AddScolarshipBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddScolarshipController());
  }
}
