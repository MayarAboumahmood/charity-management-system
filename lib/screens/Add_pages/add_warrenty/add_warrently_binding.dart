import 'package:get/get.dart';

import 'add_warrently_controller.dart';

class AddWarrentlyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddWarrentlyController());
  }
}
