import 'package:get/get.dart';
import 'edite_beneficiary_controller.dart';

class EditBeneficiaryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EditBeneficiaryController());
  }
}
