import 'package:get/get.dart';

import 'challenge_controller.dart';

class ChallengeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChallengeController());
  }
}
