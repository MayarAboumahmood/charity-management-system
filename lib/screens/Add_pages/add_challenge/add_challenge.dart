import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../componant/button.dart';
import '../../../componant/mayar_textfield.dart';
import '../../../config/size_config.dart';
import '../../../const.dart';
import 'add_challenge_controller.dart';

class AddChallenge extends StatelessWidget {
  AddChallenge({Key? key}) : super(key: key);
  final pagecontroller = PageController(
    viewportFraction: 0.75,
  );
  AddChallengeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    bool ismobile = isMobile(context);
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
      body: SafeArea(
        child: Form(
          key: controller.formstate,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: h * .05,
              ),
              Mytextfield(
                controller: controller.name,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Name',
                labletext: 'Challenge name',
                onsave: (value) {
                  controller.name.text = value ?? '';
                },
                validate: (value) {
                  if (value == "") {
                    return tr("this field can't be empty ");
                  }
                  return null;
                },
              ),
              SizedBox(
                height: h * .05,
              ),
              Mytextfield(
                controller: controller.amount,
                textType: TextInputType.number,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Amount',
                labletext: 'Amount',
                onsave: (value) {
                  controller.amount.text = value! ;
                },
                validate: (value) {
                  if (value == "") {
                    return tr("this field can't be empty ");
                  }
                  return null;
                },
              ),
              SizedBox(
                height: h * .05,
              ),
              Mytextfield(
                controller: controller.outDate,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'OutDate',
                labletext: 'OutDate',
                onsave: (value) {
                  controller.outDate.text = value ?? '';
                },
                validate: (value) {
                  if (value == "") {
                    return tr("this field can't be empty ");
                  }
                  return null;
                },
              ),
              SizedBox(
                height: h * .05,
              ),
              Mytextfield(
                controller: controller.description,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Description',
                labletext: 'Description',
                onsave: (value) {
                  controller.description.text = value ?? '';
                },
                validate: (value) {
                  if (value == "") {
                    return tr("this field can't be empty ");
                  }
                  return null;
                },
              ),
              SizedBox(
                height: h * .05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: h * .3,
                ),
              ),
              SizedBox(
                height: h * .01,
              ),
              Obx(() {
                return controller.selectImage.value != ''
                    ? SizedBox(
                        height: h * .3,
                        child: Image.file(
                          File(controller.selectImage.value),
                        ))
                    : Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Get.isDarkMode
                                  ? Themes.customdarktheme.primaryColor
                                  : Themes.customlighttheme.primaryColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(w * .005, h * 005),
                                    color: Colors.black12,
                                    spreadRadius: 1,
                                    blurRadius: 8)
                              ],
                            ),
                            height: h * .1,
                            width: w * .2,
                            child: IconButton(
                              icon: Icon(Icons.add,
                                  color: Colors.white, size: w * .15),
                              onPressed: () {
                                controller.pickimage();
                              },
                            ),
                          ),
                          Text(
                            "Add photo",
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Themes.customdarktheme.primaryColor
                                    : Themes.customlighttheme.primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: w * .04),
                          ).tr(),
                        ],
                      );
              }),
              SizedBox(
                height: h * .05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .2,
                ),
                child: ContButton(
                    myShadow: 0.008,
                    mycolor: Get.isDarkMode
                        ? Themes.customdarktheme.primaryColor
                        : Themes.customlighttheme.primaryColor,
                    title: 'Done',
                    ontap: () {
controller.onclickdone();                    },
                    myheight: 0.08,
                    mywidth: 0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
