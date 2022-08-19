import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../config/userinformation.dart';
import '../screens/applying/applyscolarshipbinding/applySolarShipServic.dart';
import 'applyScolarShipModel.dart';

class ApplyScolarShipController extends GetxController {
  late String name;
  late String age;
  late String gender;
  late String academicYear;
  late String state;
  late String city;
  late String street;
  late String phone;
  late String notes;
  late List<dynamic> documents;
  late GlobalKey<FormState> formstate;
  late ApplyScolarShipService service;
  late bool applystate;
  @override
  void onInit() {
    name = '';
    age = '';
    gender = '';
    academicYear = '';
    city = '';
    street = '';
    state = '';
    phone = '';
    notes = '';
    documents = [];
    service = ApplyScolarShipService();
    formstate = GlobalKey<FormState>();
    applystate = false;
  }

  onclickapply() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      EasyLoading.show(status: 'loading ...');
      await checkapplystate();
      if (applystate) {
        EasyLoading.showSuccess(service.message);
        Get.offAllNamed('/ScolarShip');
      } else {
        EasyLoading.showError(service.message);
      }
    }
  }

  checkapplystate() async {
    ApplyScolarShipModel model = ApplyScolarShipModel(
        name: name,
        age: age,
        gender: gender,
        academicYear: academicYear,
        location: state + "_" + city + "_" + street,
        phone: phone,
        notes: notes,
        documents: documents);
    applystate = await service.add(model, UserInformation.user_token);
  }
}
//