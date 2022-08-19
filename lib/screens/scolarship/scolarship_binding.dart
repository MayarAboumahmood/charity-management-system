import 'package:get/get.dart';
import 'package:project_one/screens/scolarship/scolarship_contoller.dart';

class ScolarShipBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ScolarShipController());
  }
}
