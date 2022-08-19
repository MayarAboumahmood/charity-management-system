import 'package:get/get.dart';
import '../../config/userinformation.dart';
import '../../models/triningModel.dart';
import 'training_opportunity_service.dart';

class TrainingOpprtunityController extends GetxController {
  late RxBool isload;
  late TrainingOpportunityService service;
  late RxList<TrainingModel> model;
  var str;
  late String message;
  @override
  // ignore: must_call_super
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    str.cancel();
  }

  void onInit() async {
    isload = true.obs;
    service = TrainingOpportunityService();
    model = <TrainingModel>[].obs;
    message = '';
    await getdata();
  }

  getdata() async {
    str = service.gettrainigStream(UserInformation.user_token).listen(
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
    /*if(model[0].collage=="null"){
      message=service.message;
      Get.offAllNamed('/Login');
    }*/
  }
}
