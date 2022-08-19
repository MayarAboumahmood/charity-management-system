import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../config/userinformation.dart';
import '../../../models/scolarshipModel.dart';
import 'add_scolarship_service.dart';

class AddScolarshipController extends GetxController {
  final TextEditingController max_number = TextEditingController();
  final String image = '';
  final TextEditingController description = TextEditingController();
  final TextEditingController academic_years = TextEditingController();
  final TextEditingController collage = TextEditingController();
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final AddScolarshipService service = AddScolarshipService();
  bool addstate = false;

  onclickdone() async {
    var formdata = formstate.currentState;
    formdata!.save();
    if (formdata.validate()) {
      EasyLoading.show(status: 'loading ...');
      await checkaddstate();
      if (addstate) {
        EasyLoading.showSuccess(service.message);
        Get.offAllNamed('/Scoraleerchape');
      } else {
        EasyLoading.showError(service.message);
      }
    }
  }

  checkaddstate() async {
    ScolarshipModel model = ScolarshipModel(
      image: image,
      max_number: max_number.text,
      description: description.text,
      academic_years: academic_years.text,
      collage: collage.text,
    );
    addstate = await service.add(model);
  }
}
