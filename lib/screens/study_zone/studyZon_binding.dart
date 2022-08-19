import 'package:get/get.dart';
import 'package:project_one/screens/study_zone/studyZone_controller.dart';

class StudyZoneBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudyZoneController());
  }
}
