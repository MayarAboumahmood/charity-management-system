import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../models/beneficiaryModel.dart';
import 'add_beneficiary_service.dart';

class AddBeneficiaryController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController reasonForAccepted = TextEditingController();
  final TextEditingController date = TextEditingController(text: '2022-12-12');
  final TextEditingController location = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController notes = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final AddBenefiiaryService service = AddBenefiiaryService();
  late bool addstate = false;

  onclickdone() async {
    var formdata = formstate.currentState;
    formdata!.save();
    print('-------------$age------------');
    if (formdata.validate()) {
      EasyLoading.show(status: 'loading ...');
      await checkaddstate();
      if (addstate) {
        EasyLoading.showSuccess('service.');
        Get.offNamed('/Beneficiary');
      } else {
        EasyLoading.showError('service');
      }
    }
  }

  checkaddstate() async {
    BeneficiaryModel model = BeneficiaryModel(
        date: date.text,
        age: age.text,
        amount: amount.text,
        name: name.text,
        location: location.text,
        phone: phone.text,
        reasonForAccepted: reasonForAccepted.text);
    addstate = await service.addBeneficiary(model: model);
  }
}
