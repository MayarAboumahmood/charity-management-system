import 'package:get/instance_manager.dart';

import 'charity_profile_conntroller.dart';

class CharityProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CharityProfileController());
    // TODO: implement dependencies
  }
}
