import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../componant/button.dart';
import '../../../../componant/challenge_image_card.dart';
import '../../../../componant/drd.dart';
import '../../../../componant/mayar_textfield.dart';
import '../../../../config/size_config.dart';
import '../../../../const.dart';
import '../../drawer/drawer.dart';
import 'add_warrently_controller.dart';

class AddWarrently extends StatelessWidget {
  AddWarrently({Key? key}) : super(key: key);
  final pagecontroller = PageController(
    viewportFraction: 0.75,
  );
  AddWarrentlyController controller = Get.find();
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
      backgroundColor: !Get.isDarkMode
          ? Themes.customdarktheme.backgroundColor
          : Themes.customlighttheme.backgroundColor,
      drawer: const DrawerPage(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: !Get.isDarkMode
            ? Themes.customdarktheme.primaryColor
            : Themes.customlighttheme.primaryColor,
        title: AutoSizeText(
          tr('Add Warrently'),
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
            children: [
              SizedBox(
                height: h * .05,
              ),
              Mytextfield(
                controller: controller.specialization,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: !Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Specializatiion',
                labletext: 'Specializatiion',
                onsave: (value) {
                  controller.specialization.text = value ?? '';
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
                controller: controller.year,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: !Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Year',
                labletext: 'Academic Year',
                onsave: (value) {
                  controller.year.text = value ?? '';
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
                textType: TextInputType.name,
                scurtext: false,
                disableColor: !Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Amount',
                labletext: 'The amount requierd',
                onsave: (value) {
                  controller.amount.text = value ?? '';
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
                controller: controller.state,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: !Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'State ',
                labletext: 'State',
                onsave: (value) {
                  controller.state.text = value ?? '';
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
                controller: controller.city,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: !Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'City',
                labletext: 'City',
                onsave: (value) {
                  controller.city.text = value ?? '';
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
                controller: controller.street,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: !Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Street',
                labletext: 'Street',
                onsave: (value) {
                  controller.street.text = value ?? '';
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
                disableColor: !Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Phon',
                labletext: 'Contact phon',
                onsave: (value) {
                  controller.phone.text = value ?? '';
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
                controller: controller.about,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: !Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'About',
                labletext: 'About',
                onsave: (value) {
                  controller.about.text = value ?? '';
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
                  horizontal: w * .3,
                ),
                child: ContButton(
                    myRadius: 30,
                    mycolor: !Get.isDarkMode
                        ? Themes.customdarktheme.primaryColor
                        : Themes.customlighttheme.primaryColor,
                    title: 'Add image',
                    ontap: () {},
                    myheight: 0.05,
                    mywidth: 0.2),
              ),
              Divider(
                thickness: h * .005, // thickness of the line
                indent: 0, // empty space to the leading edge of divider.
                endIndent:
                    0, // empty space to the trailing edge of the divider.
                color: !Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                height: 0,
              ),
              SizedBox(
                  height: h * .42,
                  width: w * .01,
                  child: CICard(
                      mycolor: !Get.isDarkMode
                          ? Themes.customdarktheme.primaryColor
                          : Themes.customlighttheme.primaryColor,
                      title: 'title',
                      ontap: () {})),
              SizedBox(
                height: h * .02,
              ),
              Divider(
                thickness: h * .005, // thickness of the line
                indent: 0, // empty space to the leading edge of divider.
                endIndent:
                    0, // empty space to the trailing edge of the divider.
                color: !Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                height: 0,
              ),
              SizedBox(
                height: h * .02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .2,
                ),
                child: ContButton(
                    myShadow: 0.008,
                    mycolor: !Get.isDarkMode
                        ? Themes.customdarktheme.primaryColor
                        : Themes.customlighttheme.primaryColor,
                    title: 'Done',
                    ontap: () {
                      controller.onclickdone();
                    },
                    myheight: 0.08,
                    mywidth: 0.3),
              ),
              SizedBox(
                height: h * .05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
