import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../componant/button.dart';
import '../../../../componant/drd.dart';
import '../../../../componant/mayar_textfield.dart';
import '../../../../config/size_config.dart';
import '../../../../const.dart';
import '../../drawer/drawer.dart';
import 'add_beneficiary_controller.dart';

class AddBeneficiary extends StatelessWidget {
  AddBeneficiaryController controller = Get.find();
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
      backgroundColor: Get.isDarkMode
          ? Themes.customdarktheme.backgroundColor
          : Themes.customlighttheme.backgroundColor,
      drawer: ismobile ? const Drawer(child: DrawerPage()) : null,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Get.isDarkMode
            ? Themes.customdarktheme.primaryColor
            : Themes.customlighttheme.primaryColor,
        title: AutoSizeText(
          tr('Add beneficiary'),
          style: TextStyle(
              fontSize: w * .06,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Schyler'),
          maxLines: 3,
        ),
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: w * .09,
            color: Colors.white,
            icon: const Icon(Icons.menu_rounded),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: controller.formstate,
          child: ListView(
            // physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: w * .01),
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
                labletext: 'Beneficiary name',
                onsave: (value) {
                  controller.name.text = value!;
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
              SizedBox(
                height: h * .05,
              ),
              // Mytextfield(
              //   controller: controller.date,
              //   textType: TextInputType.name,
              //   scurtext: false,
              //   disableColor: Get.isDarkMode
              //       ? Themes.customdarktheme.primaryColor
              //       : Themes.customlighttheme.primaryColor,
              //   enableColor: Colors.black45,
              //   hintText: 'date',
              //   labletext: 'date',
              //   onsave: (value) {
              //     controller.date.text = value!;
              //   },
              //   validate: (value) {
              //     if (value == "") {
              //       return tr("this field can't be empty ");
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(
              //   height: h * .05,
              // ),
              Mytextfield(
                controller: controller.amount,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'amount',
                labletext: 'amount',
                onsave: (value) {
                  controller.amount.text = value!;
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
                controller: controller.age,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: primaryColor,
                enableColor: Colors.black45,
                hintText: 'Age',
                labletext: 'Beneficiary age',
                onsave: (value) {
                  controller.age.text = value!;
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
                controller: controller.reasonForAccepted,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Reason for accepted',
                labletext: 'Reason for accepted',
                onsave: (value) {
                  controller.reasonForAccepted.text = value!;
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
                title: 'Location info',
              ),
              SizedBox(
                height: h * .02,
              ),

              Mytextfield(
                controller: controller.location,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'location',
                labletext: 'location',
                onsave: (value) {
                  controller.location.text = value!;
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
                title: 'Contact info',
              ),
              SizedBox(
                height: h * .02,
              ),
              Mytextfield(
                controller: controller.phone,
                textType: TextInputType.phone,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Phone',
                labletext: 'Contact phone',
                onsave: (value) {
                  controller.phone.text = value!;
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
              // Drd(
              //   title: 'more info',
              // ),
              SizedBox(
                height: h * .02,
              ),
              // Mytextfield(
              //   textType: TextInputType.name,
              //   scurtext: false,
              //   disableColor: Get.isDarkMode
              //       ? Themes.customdarktheme.primaryColor
              //       : Themes.customlighttheme.primaryColor,
              //   enableColor: Colors.black45,
              //   hintText: 'Notes',
              //   labletext: 'Notes',
              //   onsave: (value) {
              //     controller.notes = value!;
              //   },
              //   validate: (value) {
              //     if (value == "") {
              //       return tr("this field can't be empty ");
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(
              //   height: h * .05,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .1,
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
                  myheight: 0.07,
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
