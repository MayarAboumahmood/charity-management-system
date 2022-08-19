import 'dart:async';

import 'package:get/get.dart';
import 'package:project_one/config/userinformation.dart';
import 'package:project_one/screens/warrenty/warrently_service.dart';
import '../../models/warrentlymodel.dart';

class WarrentlyController extends GetxController {
  late WarrentlyService service;
  late RxList<WarrentlyModel> model;
  late RxBool isload;
  var s;
  late String message;
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    s.cancel();
  }

  @override
  void onInit() async {
    model = <WarrentlyModel>[].obs;
    isload = true.obs;
    service = WarrentlyService();
    await getdata();

    message = '';
    super.onInit();
  }

  getdata() async {
    s = service.getWarrentlyStream(UserInformation.user_token).listen((event) {
      model.value = event;
      isload.value = false;
      if (model.isEmpty) {
      } else if (model[0].specialization == "null") {
        message = service.message;
        Get.offAllNamed('/Login');
      }
    });
  }
}
