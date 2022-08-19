import 'package:get/get.dart';
import 'package:project_one/config/userinformation.dart';
import 'package:project_one/screens/scolarship/scolarship_service.dart';
import '../../models/scolarshipModel.dart';

class ScolarShipController extends GetxController {
  late RxBool isload;
  late ScolarShipService service;
  late RxList<ScolarshipModel> model;
  late String message;
  var str;
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    str.cancel();
  }

  @override
  void onInit() async {
    isload = false.obs;
    service = ScolarShipService();
    model = <ScolarshipModel>[].obs;
    await getdata();
    message = '';
  }

  getdata() async {
    str = service.getScolarshipStream(UserInformation.user_token).listen(
      (event) {
        model.value = event;
        isload.value = false;
      },
    );
    if (model.isEmpty) {
    } else if (model[0].id == "null") {
      message = service.message;
      Get.offAllNamed('/Login');
    }
  }
}
