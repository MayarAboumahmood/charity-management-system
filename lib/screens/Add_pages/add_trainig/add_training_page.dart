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
import 'add_training_controller.dart';

class AddTraining extends StatelessWidget {
  AddTrainingController controller = Get.find();
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: w * .07,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        leading: Builder(
            builder: (context) => IconButton(
                  iconSize: w *
                      .09, //-----------------------------------------------------
                  color: Colors.white,
                  icon: const Icon(Icons.menu_rounded),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                )),
        elevation: 0.0,
        backgroundColor: Get.isDarkMode
            ? Themes.customdarktheme.primaryColor
            : Themes.customlighttheme.primaryColor,
        title: AutoSizeText(
          tr('Add trining opportunity'),
          style: const TextStyle(
              fontSize: 20,
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
                controller: controller.name,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'Name',
                labletext: 'Work name',
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
                controller: controller.out_date,
                textType: TextInputType.text,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Colors.black45,
                hintText: 'out date',
                labletext: 'Out date',
                onsave: (value) {
                  controller.out_date.text = value ?? '';
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
              // Mytextfield(
              //   controller: controller.state,
              //   textType: TextInputType.name,
              //   scurtext: false,
              //   disableColor: Get.isDarkMode
              //       ? Themes.customdarktheme.primaryColor
              //       : Themes.customlighttheme.primaryColor,
              //   enableColor: Colors.black45,
              //   hintText: 'State ',
              //   labletext: 'State',
              //   onsave: (value) {
              //     controller.state.text = value ?? '';
              //   },
              //   validate: (value) {
              //     if (value == "") {
              //       return tr("this field can't be empty ");
              //     }
              //     return null;
              //   },
              // ),
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
              Mytextfield(
                controller: controller.about,
                textType: TextInputType.name,
                scurtext: false,
                disableColor: Get.isDarkMode
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
                  horizontal: MediaQuery.of(context).size.width * .2,
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
