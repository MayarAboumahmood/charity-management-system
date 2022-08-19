import 'package:get/get.dart';
import 'package:project_one/screens/user_profile/user_profile_controller.dart';

class UserProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserProfileController());
  }
}
