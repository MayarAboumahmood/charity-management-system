import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project_one/models/warrentlymodel.dart';

import '../../../config/userinformation.dart';
import '../../../models/applywarrentyModel.dart';
import 'applyWarrentyServic.dart';

class ApplyWarrentyController extends GetxController {
  final TextEditingController specialization = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController age = TextEditingController(text: '1');
  // List<String> pic = ['image_one'];
  final TextEditingController about = TextEditingController(text: 'about');
  final TextEditingController year = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController gender = TextEditingController(text: 'male');
  final TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final ApplyWarrentyService service = ApplyWarrentyService();
  bool addstate = false;

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
      specialization: specialization.text,
      year: year.text,
      about: about.text,
      amount: amount.text,
      location: location.text,
      phone: phone.text,
      age: age.text,
      gender: gender.text,
      user_id: UserInformation.usre_id,
      // pic: pic
    );
    addstate = await service.apply(model);
  }
}
//