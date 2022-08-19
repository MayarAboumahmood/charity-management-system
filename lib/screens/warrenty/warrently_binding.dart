import 'package:get/get.dart';
import 'warrenty_controller.dart';

class WarrentyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WarrentlyController());
  }
}
