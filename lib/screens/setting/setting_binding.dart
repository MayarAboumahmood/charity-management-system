import 'package:get/instance_manager.dart';

import 'setting_controller.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
  }
}
