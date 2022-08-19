import 'package:get/get.dart';
import 'applyWarrentyController.dart';


class ApplyWarrentyBinding implements Bindings{
  @override
  void dependencies() {
     Get.put(ApplyWarrentyController());
  }
  
}