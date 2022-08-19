import 'package:get/instance_manager.dart';

import 'donation_controller.dart';


class DonationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DonationController());
    // TODO: implement dependencies
  }
}
