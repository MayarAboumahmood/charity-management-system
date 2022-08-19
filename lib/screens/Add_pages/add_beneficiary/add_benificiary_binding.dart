import 'package:get/get.dart';

import 'add_beneficiary_controller.dart';

class AddBenificaryBinding implements Bindings{
  @override
  void dependencies() {
     Get.put(AddBeneficiaryController());
  }
  
}