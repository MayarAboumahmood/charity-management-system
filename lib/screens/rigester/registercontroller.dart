import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../models/registerModel.dart';
import 'registerService.dart';

class RegisterController extends GetxController {
  RxBool passwordsecure = true.obs;
  RxBool confpasswordsecrity = true.obs;
  late GlobalKey<FormState> formstate;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmpassword;
  late TextEditingController lastName;
  late TextEditingController firstName;
  late String message;
  late bool registerstate;
  late RegisterService service;

  @override
  void onInit() {
    passwordsecure = true.obs;
    confpasswordsecrity = true.obs;
    formstate = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    confirmpassword = TextEditingController();
    message = '';
    lastName = TextEditingController();
    firstName = TextEditingController();
    registerstate = false;
    service = RegisterService();
    super.onInit();
  }

  change() {
    passwordsecure.value = !passwordsecure.value;
  }

  changeconf() {
    confpasswordsecrity.value = !confpasswordsecrity.value;
  }

  void onClickregister() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      /// for check if the  values is validated
      EasyLoading.show(status: 'loading ...');
      await registerclick();
      if (registerstate) {
        EasyLoading.showSuccess(message);
        Get.offAllNamed('/UserHome');
      } else {
        EasyLoading.showError(message,
            duration: const Duration(seconds: 5), dismissOnTap: true);
      }
    }
  }

  Future<void> registerclick() async {
    RegisterModel user = RegisterModel(
        email: email.text,
        password: password.text,
        firstName: firstName.text,
        lastName: lastName.text,
        confirmpassword: confirmpassword.text);
    registerstate = await service.register(user);
    // var mapmsg = service.message;
    //   if (mapmsg is Map) {
    //     // we waiting for new api
    //     mapmsg["email"] == null ? null : message += "${mapmsg["email"][0]}\n";
    //     mapmsg["password"] == null
    //         ? null
    //         : message += "${mapmsg["password"][0]}\n";
    //     mapmsg["conf_password"] == null
    //         ? null
    //         : message += "${mapmsg["conf_password"]}[0]";
    //     mapmsg["name"] == null ? null : message += "${mapmsg["name"][0]}";
    //   } else if (mapmsg is String) {
    //     message = mapmsg;
    //   }
  }

  // @override
  // void dispose() {
  //   email.dispose();
  //   super.dispose();
  // }
}
