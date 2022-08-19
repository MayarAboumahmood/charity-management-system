import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project_one/models/workModel.dart';
import 'add_work_srvice.dart';

class AddWorkController extends GetxController {
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController out_date;
  late TextEditingController about;
  final TextEditingController location = TextEditingController(text: 'gf');
  final TextEditingController requiredExp = TextEditingController(text: 'gf');
  final TextEditingController holiday = TextEditingController(text: 'gf');

  late GlobalKey<FormState> formstate;
  late AddworkService service;
  late bool addstate;
  @override
  void onInit() {
    name = TextEditingController();
    location:
    TextEditingController();
    requiredExp:
    TextEditingController();
    phone = TextEditingController();
    about = TextEditingController();
    out_date = TextEditingController();
    formstate = GlobalKey<FormState>();
    service = AddworkService();
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
        Get.back();
      } else {
        EasyLoading.showError(service.message);
      }
    }
  }

  checkaddstate() async {
    JobModel model = JobModel(
        name: name.text,
        about: about.text,
        out_date: out_date.text,
        phone: phone.text,
        location: location.text,
        requiredExp: requiredExp.text);
    addstate = await service.addTrainings(model);
  }
}
