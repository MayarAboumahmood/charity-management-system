import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../config/userinformation.dart';
import '../../../models/study_zone_model.dart';
import 'edit_study_service.dart';

class EditStudyZoneController extends GetxController {
  late String name;
  late String state;
  late String city;
  late String street;
  late String phone;
  late String location;
  late String description;
  late String available_times;
  late String? id;
  late GlobalKey<FormState> formstate;
  late EditStudyZoneService service;
  late bool addstate;
  late StudyZoneModel model;
  @override
  void onInit() {
    model = Get.arguments;
    name = model.name;
    available_times = model.availableTimes;
    location = model.location;
    phone = model.phone;
    id = model.id.toString();
    description = model.description;
    formstate = GlobalKey<FormState>();
    service = EditStudyZoneService();
    addstate = false;
  }

  onclickdone() async {
    var formdata = formstate.currentState;
    formdata!.save();
    if (formdata.validate()) {
      EasyLoading.show(status: 'loading ...');
      await checkaddstate();
      if (addstate) {
        EasyLoading.showSuccess(service.message);
        Get.back();
      } else {
        EasyLoading.showError(service.message);
      }
    }
  }

  checkaddstate() async {
    model = StudyZoneModel(
        name: name,
        location: location,
        phone: phone,
        availableTimes: available_times,
        description: description,
        id: id.toString());
    addstate = await service.add(model, UserInformation.user_token);
  }
}
