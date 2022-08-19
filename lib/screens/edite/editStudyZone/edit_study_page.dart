import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../componant/button.dart';
import '../../../componant/drd.dart';
import '../../../componant/mayar_textfield.dart';
import '../../../config/size_config.dart';
import '../../../const.dart';
import '../../drawer/drawer.dart';
import 'edit_study_contoller.dart';
import 'package:easy_localization/easy_localization.dart';

class EditStudy extends StatelessWidget {
  EditStudyZoneController controller = Get.find();
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
      drawer: const DrawerPage(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Get.isDarkMode
            ? Themes.customdarktheme.primaryColor
            : Themes.customlighttheme.primaryColor,
        title: AutoSizeText(
          tr('Edit Study Zone'),
          style: TextStyle(
              fontSize: w * .04,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Schyler'),
          maxLines: 3,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: controller.formstate,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: w * .01),
            children: [
              SizedBox(
                height: h * .05,
              ),
              Mytextfield(
                initvalue: controller.name,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Name',
                labletext: 'Study Zone Name',
                onsave: (value) {
                  controller.name = value ?? '';
                },
                validate: (value) {
                  if (value == "") {
                    return "this field can't be empty ";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: h * .05,
              ),
              Mytextfield(
                initvalue: controller.available_times,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Aviable Time',
                labletext: 'Aviable Time',
                onsave: (value) {
                  controller.available_times = value ?? '';
                },
                validate: (value) {
                  if (value == "") {
                    return "this field can't be empty ";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: h * .05,
              ),
              Drd(
                title: 'Location info',
              ),
              SizedBox(
                height: h * .02,
              ),
              Mytextfield(
                initvalue: controller.location,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'location',
                labletext: 'location',
                onsave: (value) {
                  controller.location = value ?? '';
                },
                validate: (value) {
                  if (value == "") {
                    return "this field can't be empty ";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: h * .05,
              ),
              Drd(
                title: 'Contact info',
              ),
              SizedBox(
                height: h * .02,
              ),
              Mytextfield(
                initvalue: controller.phone,
                textType: TextInputType.phone,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Phone',
                labletext: 'Contact phone',
                onsave: (value) {
                  controller.phone = value ?? '';
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
              Drd(
                title: 'more info',
              ),
              SizedBox(
                height: h * .02,
              ),
              Mytextfield(
                initvalue: controller.description,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'description',
                labletext: 'description',
                onsave: (value) {
                  controller.description = value ?? '';
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
                  horizontal: w * .2,
                ),
                child: ContButton(
                  myShadow: 0.008,
                  mycolor: Get.isDarkMode
                      ? Themes.customdarktheme.primaryColor
                      : Themes.customlighttheme.primaryColor,
                  title: 'Done',
                  ontap: () {
                    controller.onclickdone();
                  },
                  myheight: 0.08,
                  mywidth: 0.3,
                ),
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
