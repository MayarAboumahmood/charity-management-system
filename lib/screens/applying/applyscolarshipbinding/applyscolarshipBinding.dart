import 'package:get/get.dart';
import '../../../models/applayScoalrShipController.dart';

class ApplyScoalrShipBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ApplyScolarShipController());
  }
}
