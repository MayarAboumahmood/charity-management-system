import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../config/userinformation.dart';
import '../../../models/warrentlymodel.dart';
import 'add_worrently_service.dart';

class AddWarrentlyController extends GetxController {
  late TextEditingController specialization;
  late TextEditingController amount;
  late TextEditingController age;
  late List<String> pic;
  late TextEditingController about;
  late TextEditingController year;
  late TextEditingController state;
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController phone;
  late GlobalKey<FormState> formstate;
  late AddWarrentlyService service;
  late bool addstate;
  @override
  void onInit() {
    specialization = TextEditingController();
    about = TextEditingController();
    pic = [];
    age = TextEditingController();
    amount = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    state = TextEditingController();
    phone = TextEditingController();
    year = TextEditingController();
    formstate = GlobalKey<FormState>();
    service = AddWarrentlyService();
    addstate = false;
  }

  onclickdone() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      EasyLoading.show(status: 'loading ...');
      await checkaddstate();
      if (addstate) {
        EasyLoading.showSuccess(service.message);
        Get.offAllNamed('/Warrenty');
      } else {
        EasyLoading.showError(service.message);
      }
    }
  }

  checkaddstate() async {
    WarrentlyModel model = WarrentlyModel(
      gender: 's',
      user_id: 2,
      specialization: specialization.text,
      year: year.text,
      about: about.text,
      amount: amount.text,
      location: state.text + "_" + city.text + "_" + street.text,
      phone: phone.text,
      age: age.text,
    );
    addstate = await service.add(model, UserInformation.user_token);
  }
}
