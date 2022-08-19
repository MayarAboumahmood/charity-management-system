import 'package:get/get.dart';

import 'edit_training_controller.dart';

class EditTrainingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EditTrainingController());
  }
}
