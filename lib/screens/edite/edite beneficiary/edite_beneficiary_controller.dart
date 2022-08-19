import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project_one/screens/edite/edite%20beneficiary/edite_beneficiary_service.dart';
import '../../../models/beneficiaryModel.dart';

class EditBeneficiaryController extends GetxController {
  late String name;
  late String phone;
  late String reasonForAccepted;
  late String age;
  late String id;
  final String date = '2022-6-6';
  late String amount;
  late String location;
  late BeneficiaryModel model;
  final EditBeneficiaryService service = EditBeneficiaryService();
  late bool editstate;
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    model = Get.arguments;
    name = model.name;
    reasonForAccepted = model.reasonForAccepted;
    phone = model.phone;
    age = model.age;
    amount = model.amount;
    location = model.location;
    id = model.id ?? '0';
    editstate = false;
  }

  onclickdone() async {
    var formdata = formstate.currentState;
    formdata!.save();
    if (formdata.validate()) {
      EasyLoading.show(status: 'loading ...');
      await checkaddstate();
      if (editstate) {
        EasyLoading.showSuccess('service.');
        Get.offNamed('/Beneficiary');
      } else {
        EasyLoading.showError('service');
      }
    }
  }

  checkaddstate() async {
    BeneficiaryModel model = BeneficiaryModel(
      date: date,
      id: id,
      age: age,
      amount: amount,
      location: location,
      name: name,
      phone: phone,
      reasonForAccepted: reasonForAccepted,
    );
    editstate = await service.addBeneficiary(model: model);
  }
}
