import 'package:get/get.dart';
import '../../config/userinformation.dart';
import '../../models/beneficiaryModel.dart';
import 'beneficiary_service.dart';

class BeneficiaryController extends GetxController {
  late BeneficiaryService service;
  late String message;
  late RxList<BeneficiaryModel> model;
  late RxBool isload;
  var str;
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    str.cancel();
  }

  void onInit() async {
    service = BeneficiaryService();
    message = '';
    model = <BeneficiaryModel>[].obs;
    isload = true.obs;
    await getdata();
  }

  getdata() async {
    str = service.getStudyZoneStream(UserInformation.user_token).listen(
      (event) {
        model.value = event;
        isload.value = false;
      },
    );
    isload.value = false;
    if (model.isEmpty) {
    } else if (model[0].name == "null") {
      // message = service.message;
      Get.offAllNamed('/Login');
    }
  }
}
