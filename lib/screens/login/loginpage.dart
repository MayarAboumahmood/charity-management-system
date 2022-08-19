import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../componant/button.dart';
import '../../componant/costum_textfield.dart';
import '../../config/size_config.dart';
import '../../const.dart';
import 'loginconrtoller.dart';
import 'package:easy_localization/easy_localization.dart';

class Login extends StatelessWidget {
  LoginController controller = Get.find();
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
          tr("Help student "),
          style: TextStyle(
            fontFamily: "Schyler",
            fontSize: w * .07,
            color: Get.isDarkMode
                ? Themes.customdarktheme.primaryColor
                : Themes.customlighttheme.primaryColor,
          ),
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
                height: h * .2,
              ),
              AutoSizeText(
                tr("Sign in "),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: w * .07,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: h * .1,
              ),
              CostumField(
                  onsaved: (Value) {
                    controller.email = Value!;
                  },
                  sucer: false,
                  inputtype: TextInputType.emailAddress,
                  hint: 'enter your email',
                  label: "email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  validat: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (!emailValid) {
                      return (tr("Wrong email"));
                    }
                    return null;
                  }),
              SizedBox(
                height: h * .05,
              ),
              Obx(
                () {
                  return CostumField(
                    onsaved: (Value) {
                      controller.password = Value!;
                    },
                    hint: tr('enter your password'),
                    label: tr("password"),
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
                height: h * .005,
              ),
              Row(
                children: [
                  AutoSizeText(
                    tr("Don't have an account?"),
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.grey,
                        fontSize: w * .03),
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
                      Get.offAllNamed('/Register');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: h * .11,
              ),
              ContButton(
                myheight: 0.08,
                mywidth: 0.2,
                ontap: () {
                  controller.onClicksignin();
                },
                title: tr("Continue"),
                mycolor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
              ),
              SizedBox(
                height: h * .1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
