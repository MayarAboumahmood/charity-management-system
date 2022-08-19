import 'package:get/get.dart';
import 'package:project_one/config/userinformation.dart';
import '../../models/challlengeModel.dart';
import 'challenge_service.dart';

class ChallengeController extends GetxController {
  late ChallengeService service;
  late String message;
  late RxList<ChallengeModel> model;
  late RxList<ChallengeModel> modelTrinding;
  late RxBool isload;
  dynamic s;
  dynamic s1;
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    s.cancal();
    s1.cancal();
  }

  @override
  void onInit() async {
    service = ChallengeService();
    message = '';
    model = <ChallengeModel>[].obs;
    modelTrinding = <ChallengeModel>[].obs;
    await getdata();
    isload = false.obs;
  }

  getdata() async {
    s = service.getChallengeStream(UserInformation.user_token).listen(
      (event) {
        model.value = event;
        isload.value = false;
        if (model.isEmpty) {
        } else if (model[0].id == "null") {
          message = service.message;
          Get.offAllNamed('/Login');
        }
      },
    );
    s1 = service.getChallengeTrindingStream(UserInformation.user_token).listen(
      (event) {
        modelTrinding.value = event;
        isload.value = false;
        if (model.isEmpty) {
        } else if (model[0].id == "null") {
          message = service.message;
          Get.offAllNamed('/Login');
        }
      },
    );
  }
}
