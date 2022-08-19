import 'package:get/get.dart';
import 'add_training_controller.dart';


class AddTrainingBinding implements Bindings{
  @override
  void dependencies() {
     Get.put(AddTrainingController());
  }
  
}