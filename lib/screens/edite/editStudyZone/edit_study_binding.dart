import 'package:get/get.dart';

import 'edit_study_contoller.dart';

class EditStudyZoneBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EditStudyZoneController());
  }
}
