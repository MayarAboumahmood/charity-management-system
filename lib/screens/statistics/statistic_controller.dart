import 'package:get/get.dart';
import 'package:project_one/screens/statistics/statistic_service.dart';
import '../../config/userinformation.dart';
import '../../models/statistic_model.dart';

class StatisticController extends GetxController {
  // late StatisticService service;
  late String message;
  late RxList<StatisticModel> model;
  late RxBool isload;
  @override
  void onInit() async {
    // service = StatisticService();
    message = '';
    model = <StatisticModel>[].obs;
    isload = false.obs;
    await getdata();
  }

  getdata() async {
    // service.getStatisticStream(UserInformation.user_token).listen(
    (event) {
      model.value = event;
      isload.value = false;
      // },
      // );
      if (model.isEmpty) {
      } else if (model[0].tBeneficiary == "null") {
        // message = service.message;
        Get.offAllNamed('/Login');
      }
      ;
    };
// }
  }
}
