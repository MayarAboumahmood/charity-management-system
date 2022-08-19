import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../componant/button.dart';
import '../../../../componant/drd.dart';
import '../../../../componant/mayar_textfield.dart';
import '../../../../config/size_config.dart';
import '../../../../const.dart';
import '../../drawer/drawer.dart';
import 'add_study_contoller.dart';

class AddStudy extends StatelessWidget {
  AddStudyZoneController controller = Get.find();
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
      drawer: const Drawer(child: DrawerPage()),
      appBar: AppBar(
          title: Text(
            tr('Add study zones'),
            style: TextStyle(
                fontFamily: 'Schyler', color: Colors.white, fontSize: w * .07),
          ),
          elevation: 0,
          backgroundColor: Get.isDarkMode
              ? Themes.customdarktheme.primaryColor
              : Themes.customlighttheme.primaryColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                size: w * .08,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          leading: Builder(
              builder: (context) => IconButton(
                    iconSize: w * .09,
                    color: Colors.white,
                    icon: const Icon(Icons.menu_rounded),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ))),
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
                labletext: 'Study Zone Name',
                onsave: (value) {
                  controller.name.text = value ?? '';
                  // controller.namev = controller.name.text;
                  print('onsave: ${controller.name.text}');
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
                // onFieldSubmitted: (value) {
                //   controller.available_times.text = value;
                //   print('onsubmate: $value');
                // },
                controller: controller.available_times,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Aviable Time',
                labletext: 'Aviable Time',
                onsave: (value) {
                  print('onsave: ${controller.available_times.text}');
                  controller.available_times.text = value ?? '';
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
              SizedBox(
                height: h * .05,
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
                  controller.location.text = value ?? '';
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
              Drd(
                title: 'more info',
              ),
              SizedBox(
                height: h * .02,
              ),
              Mytextfield(
                controller: controller.description,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'description',
                labletext: 'description',
                onsave: (value) {
                  print('onsave: ${controller.description.text}');
                  // controller.descriptionv = controller.description.text;
                  controller.description.text = value ?? '';
                },
                validate: (value) {
                  if (value == "") {
                    controller.description.text = 'hello';
                    // return tr("this field can't be empty ");
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
                    print('name:' +
                        controller.name.text +
                        '===========' +
                        '\n' +
                        ":des" +
                        controller.description.text +
                        '\n' +
                        ":avilaple" +
                        controller.available_times.text +
                        '\n' +
                        "location:" +
                        controller.location.text);
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
