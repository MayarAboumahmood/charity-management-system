import 'package:get/get.dart';
import 'package:project_one/config/userinformation.dart';
import 'package:project_one/screens/study_zone/studyZone_service.dart';
import '../../models/study_zone_model.dart';

class StudyZoneController extends GetxController {
  late StudyZoneService service;
  late String message;
  late RxList<StudyZoneModel> model;
  late RxBool isload;
  var d;
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    d.cancel();
  }

  @override
  void onInit() async {
    service = StudyZoneService();
    message = '';
    model = <StudyZoneModel>[].obs;
    isload = true.obs;
    await getdata();
  }

  getdata() {
    d = service.getStudyZoneStream(UserInformation.user_token).listen(
      (event) {
        model.value = event;
        isload.value = false;
      },
    );
    if (model.isEmpty) {
    } else if (model[0].name == "null") {
      message = service.message;
      Get.offAllNamed('/Login');
    }
  }
}
