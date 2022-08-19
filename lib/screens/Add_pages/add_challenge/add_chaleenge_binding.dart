import 'package:get/get.dart';

import 'add_challenge_controller.dart';

class AddChallengeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddChallengeController());
  }
}
