import 'package:get/get.dart';

import 'registercontroller.dart';

class RegisterBinding implements Bindings{
  @override
  void dependencies() {
     Get.put(RegisterController());
  }
  
}