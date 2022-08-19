import 'package:get/get.dart';
import 'job_opportuity_controller.dart';

class JobBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(JobController());
  }
}
