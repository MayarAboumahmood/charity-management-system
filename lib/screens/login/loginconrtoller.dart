import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../config/userinformation.dart';
import '../../models/loginModel.dart';
import 'loginServic.dart';

class LoginController extends GetxController {
  late RxBool passwordsecure;
  late String email;
  late String password;
  late LoginService service;
  late String message;
  late bool loginstate;
  late GlobalKey<FormState> formstate;

  @override
  void onInit() {
    passwordsecure = true.obs;
    formstate = GlobalKey<FormState>();

    email = '';
    password = '';
    message = '';
    service = LoginService();
    loginstate = false;
    super.onInit();
  }

  change() {
    passwordsecure.value = !passwordsecure.value;
  }

  void onClicksignin() async {
    // Get.offAllNamed("/Admin_Home");

    ///decide next rout
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      /// for check if the  values is validated
      formdata.save();
      if (email == 'shaz@a.com' ||
          email == 'abee@r.com' ||
          email == 'aya@google.com') {
        UserInformation.usertype = 'admin';
        print(UserInformation.usertype);
      }
      print(email);
      print(password);
      EasyLoading.show(status: 'loading ...');
      await loginclick();
      if (loginstate) {
        print(UserInformation.usertype);
        EasyLoading.showSuccess(message);
        if (UserInformation.usertype ==
            "admin") //check if the user is admin or not

        {
          Get.offAllNamed("/Admin_Home");
        } else {
          Get.offAllNamed("/UserHome");
        }
      } else {
        EasyLoading.showError(message,
            duration: const Duration(seconds: 2), dismissOnTap: true);
      }
    }
  }

  Future<void> loginclick() async {
    ////call the function in service class
    LoginModel user = LoginModel(email: email, password: password);
    loginstate = await service.login(user);
    var mapmsg = service.message;
    if (mapmsg is Map) {
      message = '${mapmsg["email"][0]}\n${mapmsg["password"][0]}';
    } else if (mapmsg is String) {
      message = mapmsg;
    }
  }
}
