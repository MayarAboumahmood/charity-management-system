import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../config/userinformation.dart';
import '../../../../models/challlengeModel.dart';
import 'add_challenge_service.dart';

class AddChallengeController extends GetxController {
  late TextEditingController name;
  late TextEditingController amount;
  late TextEditingController inDate; //هي نحنا بنبعثا لما ننشا التحدي
  late TextEditingController outDate;
  late TextEditingController image;
  late TextEditingController amountPaid;
  late TextEditingController description;
  late GlobalKey<FormState> formstate;
  late AddChallengeService service;
  late bool addstate;
  late RxString selectImage;
  @override
  void onInit() {
    name = TextEditingController();
    image = TextEditingController();
    inDate = TextEditingController();
    outDate = TextEditingController();
    amountPaid = TextEditingController();
    amount = TextEditingController();
    description = TextEditingController();
    formstate = GlobalKey<FormState>();
    service = AddChallengeService();
    addstate = false;
    selectImage = ''.obs;
  }

  Future pickimage() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (myfile != null) {
      selectImage.value = myfile.path;
    }
  }

  onclickdone() async {
    var formdata = formstate.currentState;
    formdata!.save();
    print(amount.text);
    if (formdata.validate()) {
      EasyLoading.show(status: 'loading ...');
      await checkaddstate();
      if (addstate) {
        EasyLoading.showSuccess(service.message);
        Get.offAllNamed('/Beneficiary');
      } else {
        EasyLoading.showError(service.message);
      }
    }
  }

  checkaddstate() async {
    ChallengeModel model = ChallengeModel(
      amountPaid: double.tryParse(amountPaid.text) ?? 0.0,
      name: name.text,
      description: description.text,
      image: image.text,
      inDate: inDate.text,
      outDate: outDate.text,
      amount: double.tryParse(amountPaid.text) ?? 0.0,
    );
    addstate = await service.add(model, UserInformation.user_token);
  }
}
