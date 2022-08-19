import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../config/userinformation.dart';
import '../../../../models/study_zone_model.dart';
import 'add_study_service.dart';

class AddStudyZoneController extends GetxController {
  final name = TextEditingController();
  final phone = TextEditingController();
  final location = TextEditingController();
  final description = TextEditingController();
  final available_times = TextEditingController();

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  AddStudyZoneService service = AddStudyZoneService();
  bool addstate = false;

  onclickdone() async {
    var formdata = formstate.currentState;
    formdata!.save();
    if (formdata.validate()) {
      EasyLoading.show(status: 'loading ...');
      await checkaddstate();
      if (addstate) {
        EasyLoading.showSuccess('service.');
        Get.offNamed('/Studyzone');
      } else {
        EasyLoading.showError('service');
      }
    }
  }

  checkaddstate() async {
    StudyZoneModel model = StudyZoneModel(
        name: name.text,
        location: location.text,
        phone: phone.text,
        availableTimes: available_times.text,
        description: description.text);

    addstate = await service.addStudyZones(model: model);
  }
}
