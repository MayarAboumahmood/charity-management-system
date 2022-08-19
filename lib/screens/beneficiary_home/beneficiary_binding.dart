import 'package:get/get.dart';

import 'beneficiary_controller.dart';

class BeneficiaryBindind implements Bindings {
  @override
  void dependencies() {
    Get.put(BeneficiaryController());
  }
}
