import 'package:get/get.dart';
import 'package:project_one/screens/training_opportunity/training_opprtunity_controller.dart';

class TriningOpprtunityBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TrainingOpprtunityController());
  }
}
