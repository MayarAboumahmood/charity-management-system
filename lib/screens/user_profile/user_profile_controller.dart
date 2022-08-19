import 'package:get/get.dart';
import 'package:project_one/screens/user_profile/user_profile_service.dart';
import '../../config/userinformation.dart';
import '../../models/user_profile_model.dart';

class UserProfileController extends GetxController {
  late UserProfileService service;
  late String message;
  late UserProfileModel model;
  late RxBool isload;
  @override
  void onInit() async {
    service = UserProfileService();
    // await getdata();
    message = '';
    isload = true.obs;
    model = await service.getStudyZones(UserInformation.user_token);
    isload = false.obs;
  }

  getdata() async {
    model = (await service.getStudyZones(UserInformation.user_token));
    isload.value = false;
    if (model.name == "null") {
      message = service.message;
      Get.offAllNamed('/Login');
    }
  }
}
