import 'package:get/get.dart';
import 'add_study_contoller.dart';

class AddStudyZoneBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddStudyZoneController());
  }
}
