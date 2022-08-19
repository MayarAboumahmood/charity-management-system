import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../models/donationModel.dart';
import 'donaton_service.dart';

class DonationController extends GetxController {
  List<Map<String, String>> pagedetals = [
    {"image": "images/onboard1.jpg"},
    {"image": "images/onboard2.jpg"},
    {"image": "images/onboard3.jpg"}
  ];
  late DonationService service;
  late bool donateState;
  late String dAmount = '0';
  late int userId;
  late double pankNum;
  late GlobalKey<FormState> formstate;

  var pageindex;
  @override
  void onInit() async {
    formstate = GlobalKey<FormState>();

    pageindex = 1.obs;
    service = DonationService();
    donateState = false;
    dAmount = '';
    userId = 0;
    pankNum = 0;
    super.onInit();
  }

  onclickdone() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      EasyLoading.show(status: 'loading ...');
      await checkaddstate();
      if (donateState) {
        EasyLoading.showSuccess(service.message);
        Get.offAllNamed('/UserHome');
      } else {
        EasyLoading.showError(service.message);
      }
    }
  }

  checkaddstate() async {
    DonatModel model =
        DonatModel(dAmount: dAmount, userId: userId, pankNum: pankNum);
    donateState = await service.donat(model /*, UserInformation.user_token*/);
  }
}
