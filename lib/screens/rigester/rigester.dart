import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/screens/rigester/registercontroller.dart';
import '../../componant/button.dart';
import '../../componant/costum_textfield.dart';
import '../../config/size_config.dart';
import '../../const.dart';
import 'package:easy_localization/easy_localization.dart';

class Register extends StatelessWidget {
  RegisterController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    bool isportrai = isPortrait(context);
    double h, w;
    if (isportrai) {
      h = MediaQuery.of(context).size.height;
      w = MediaQuery.of(context).size.width;
    } else {
      w = MediaQuery.of(context).size.height;
      h = MediaQuery.of(context).size.width;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: AutoSizeText(
          tr("Help Student "),
          style: TextStyle(
              fontFamily: "Schyler",
              fontSize: w * .07,
              color: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Form(
          key: controller.formstate,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: w * .07),
            children: [
              SizedBox(
                height: h * .12,
              ),
              AutoSizeText(
                tr("Register "),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: w * .07,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h * .06,
              ),
              CostumField(
                sucer: false,
                inputtype: TextInputType.name,
                prefixIcon: const Icon(Icons.person),
                hint: 'enter your Name',
                controller: controller.firstName,
                label: "name",
                onsaved: (value) {
                  controller.firstName.text = value ?? "";
                  controller.lastName.text = value ?? "";
                },
                validat: (value) {
                  if (value == "") {
                    return tr("Please input your name");
                  }

                  return null;
                },
              ),
              SizedBox(
                height: h * .03,
              ),
              CostumField(
                  sucer: false,
                  inputtype: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email),
                  hint: 'enter your email',
                  label: "email",
                  onsaved: (value) {
                    controller.email.text = value ?? "";
                  },
                  controller: controller.email,
                  validat: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (!emailValid) {
                      return tr("Wrong email");
                    }
                    return null;
                  }),
              SizedBox(
                height: h * .03,
              ),
              Obx(
                () {
                  return CostumField(
                    hint: 'enter your password',
                    controller: controller.password,
                    label: "password",
                    onsaved: (value) {
                      controller.password.text = value ?? "";
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.change();
                      },
                      icon: controller.passwordsecure.value
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.lock),
                    ),
                    prefixIcon: const Icon(Icons.password),
                    sucer: controller.passwordsecure.value,
                    validat: (value) {
                      if (value!.length < 4) {
                        return tr(
                            "the password can't be smaller than 4 character ");
                      }
                      return null;
                    },
                  );
                },
              ),
              SizedBox(
                height: h * .03,
              ),
              Obx(
                () {
                  return CostumField(
                    hint: 'Confirm password',
                    controller: controller.confirmpassword,
                    label: "Confirm password",
                    onsaved: (value) {
                      controller.confirmpassword.text = value ?? "";
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.changeconf();
                      },
                      icon: controller.confpasswordsecrity.value
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.lock),
                    ),
                    prefixIcon: const Icon(Icons.password),
                    sucer: controller.confpasswordsecrity.value,
                    validat: (value) {
                      if (value != controller.password.text) {
                        return "the confirm password isn't correct! ";
                      }
                      return null;
                    },
                  );
                },
              ),
              Row(
                children: [
                  AutoSizeText(
                    "Do you have an account?",
                    style: TextStyle(color: Colors.grey, fontSize: w * .03),
                  ),
                  GestureDetector(
                    child: AutoSizeText(
                      tr("Click hire"),
                      style: TextStyle(
                          color: Get.isDarkMode
                              ? Themes.customdarktheme.primaryColor
                              : Themes.customlighttheme.primaryColor,
                          fontSize: w * .04),
                    ),
                    onTap: () {
                      Get.offAllNamed('/Login');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: h * .07,
              ),
              ContButton(
                myheight: 0.08,
                mywidth: 0.2,
                ontap: () {
                  controller.onClickregister();
                },
                title: "Continue",
                mycolor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
              ),
              SizedBox(
                height: h * .03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
