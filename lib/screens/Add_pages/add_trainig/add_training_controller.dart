import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../config/userinformation.dart';
import '../../../../models/triningModel.dart';
import 'add_Training_service.dart';

class AddTrainingController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController out_date = TextEditingController();
  final TextEditingController about = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController required_experience =
      TextEditingController(text: "lllllll");
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final AddTriningService service = AddTriningService();
  bool addstate = false;

  onclickdone() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      EasyLoading.show(status: 'loading ...');
      await checkaddstate();
      if (addstate) {
        EasyLoading.showSuccess(service.message);
        Get.offNamed('/Trainning');
      } else {
        EasyLoading.showError(service.message);
      }
    }
  }

  checkaddstate() async {
    TrainingModel model = TrainingModel(
        name: name.text,
        about: about.text,
        out_date: out_date.text,
        phone: phone.text,
        required_experience: required_experience.text,
        location: location.text);
    addstate = await service.addTrainings(model);
  }
}
