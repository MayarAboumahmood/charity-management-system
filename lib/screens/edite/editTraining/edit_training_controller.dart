import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../config/userinformation.dart';
import '../../../models/triningModel.dart';
import 'edit_Training_service.dart';

class EditTrainingController extends GetxController {
  late String name;
  late String phone;
  late String out_date;
  late String id;
  late String about;
  late String location;
  late String requiredExp;
  late GlobalKey<FormState> formstate;
  late EditTrainingService service;
  late bool addstate;
  late TrainingModel model;
  @override
  void onInit() {
    model = Get.arguments;
    name = model.name;
    location = model.location;
    id = model.id.toString();
    phone = model.phone;
    about = model.about;
    out_date = model.out_date;
    requiredExp = model.required_experience;
    formstate = GlobalKey<FormState>();
    service = EditTrainingService();
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
        Get.offNamed('/TrainingOpportunity');
      } else {
        EasyLoading.showError(service.message);
      }
    }
  }

  checkaddstate() async {
    TrainingModel model = TrainingModel(
        name: name,
        about: about,
        out_date: out_date,
        phone: phone,
        id: id,
        location: location,
        required_experience: requiredExp);
    addstate = await service.add(model, UserInformation.user_token);
  }
}
