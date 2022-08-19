import 'package:get/get.dart';
import 'package:project_one/config/userinformation.dart';
import '../../models/workModel.dart';
import 'job_opportuity_service.dart';

class JobController extends GetxController {
  late JobOpportuityService service;
  late RxList<JobModel> model;
  late String specialization;
  late String WorKHours;
  late String phon;
  late String about;
  late String location;
  late RxBool isload;
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
    model = <JobModel>[].obs;
    isload = true.obs;
    service = JobOpportuityService();
    message = '';
    await getdata();
    super.onInit();
  }

  getdata() async {
    str = service.getJobStream(UserInformation.user_token).listen(
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
    isload.value = false;
  }
}
