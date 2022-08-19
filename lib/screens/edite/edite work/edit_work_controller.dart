import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../config/userinformation.dart';
import '../../../models/workModel.dart';
import 'edit_work_service.dart';

class EditWorkController extends GetxController {
  late String name;
  late String phone;
  late String holidays;
  late String about;
  late String out_date;
  late String location;
  late String requiredExp;
  late GlobalKey<FormState> formstate;
  late EditWorkService service;
  late bool editstate;
  late JobModel model;
  @override
  void onInit() {
    model = Get.arguments;
    out_date = model.out_date;
    name = model.name;
    location = model.location;
    phone = model.phone;
    about = model.about;
    // holidays = model.holidays;
    formstate = GlobalKey<FormState>();
    service = EditWorkService();
    editstate = false;
  }

  onclickdone() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      EasyLoading.show(status: 'loading ...');
      await checkaddstate();
      if (editstate) {
        EasyLoading.showSuccess(service.message);
        Get.offAllNamed('/Work');
      } else {
        EasyLoading.showError(service.message);
      }
    }
  }

  checkaddstate() async {
    JobModel model = JobModel(
        // holidays: holidays,
        name: name,
        about: about,
        out_date: out_date,
        phone: phone,
        location: location,
        requiredExp: requiredExp);
    editstate = await service.add(model, UserInformation.user_token);
  }
}
