import 'package:get/get.dart';
import 'package:project_one/models/charity_profile_model.dart';
import 'package:project_one/screens/charity_profile/charity_profile_service.dart';
import '../../config/userinformation.dart';

class CharityProfileController extends GetxController {
  late RxList<CharityProfileModel> model;
  late CharityProfileServic service;
  late String message;
  late RxBool isload;

  List<Map<String, String>> pagedetals = [
    {"image": "images/onboard1.jpg"},
    {"image": "images/onboard2.jpg"},
    {"image": "images/onboard3.jpg"}
  ];
  var pageindex;
  @override
  void onInit() async {
    // model = await service.getCharityProfile();
    service = CharityProfileServic();
    model = <CharityProfileModel>[].obs;
    pageindex = 1.obs;
    super.onInit();
    isload = true.obs;
    await getdata();
  }

  getdata() async {
    model.value = await service.getCharityProfile(UserInformation.user_token);
    if (model.isEmpty) {
    } else if (model[0].theImportantInfo == "null") {
      message = service.message;
      Get.offAllNamed('/Login');
    }
    isload.value = false;
  }
}
