import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/models/applayScoalrShipController.dart';
import '../../../componant/button.dart';
import '../../../componant/challenge_image_card.dart';
import '../../../componant/drd.dart';
import '../../../componant/mayar_textfield.dart';
import '../../../config/size_config.dart';
import '../../../const.dart';
import '../../drawer/drawer.dart';

class ApplayScolarShip extends StatelessWidget {
  ApplayScolarShip({Key? key}) : super(key: key);
  final pagecontroller = PageController(
    viewportFraction: 0.75,
  );
  ApplyScolarShipController controller = Get.find();
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
            'Applying for scoalr ship',
            style: TextStyle(
                fontFamily: 'Schyler', color: Colors.white, fontSize: w * .05),
          ).tr(),
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
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: h * .05,
            ),
            Mytextfield(
              textType: TextInputType.name,
              scurtext: false,
              disableColor: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              enableColor: Colors.black45,
              hintText: 'Full name',
              labletext: 'Full name',
              onsave: (value) {
                controller.name = value ?? '';
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
              textType: TextInputType.name,
              scurtext: false,
              disableColor: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              enableColor: Colors.black45,
              hintText: 'Age',
              labletext: 'Age',
              onsave: (value) {
                controller.age = value ?? '';
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
              textType: TextInputType.name,
              scurtext: false,
              disableColor: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              enableColor: Colors.black45,
              hintText: 'Male / Female',
              labletext: 'Gender',
              onsave: (value) {
                controller.gender = value ?? '';
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
              textType: TextInputType.name,
              scurtext: false,
              disableColor: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              enableColor: Colors.black45,
              hintText: 'Academic year',
              labletext: 'Academic year',
              onsave: (value) {
                controller.academicYear = value ?? '';
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
              textType: TextInputType.name,
              scurtext: false,
              disableColor: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              enableColor: Colors.black45,
              hintText: 'State ',
              labletext: 'State',
              onsave: (value) {
                controller.state = value ?? '';
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
              textType: TextInputType.name,
              scurtext: false,
              disableColor: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              enableColor: Colors.black45,
              hintText: 'City',
              labletext: 'City',
              onsave: (value) {
                controller.city = value ?? '';
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
              textType: TextInputType.name,
              scurtext: false,
              disableColor: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              enableColor: Colors.black45,
              hintText: 'Street',
              labletext: 'Street',
              onsave: (value) {
                controller.street = value ?? '';
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
            Mytextfield(
              textType: TextInputType.name,
              scurtext: false,
              disableColor: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              enableColor: Colors.black45,
              hintText: "What do you say for us",
              labletext: "Notes",
              onsave: (value) {
                controller.notes = value ?? '';
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
              child: Column(
                children: [
                  ContButton(
                      myRadius: 30,
                      mycolor: Get.isDarkMode
                          ? Themes.customdarktheme.primaryColor
                          : Themes.customlighttheme.primaryColor,
                      title: 'Add your documents',
                      ontap: () {},
                      myheight: 0.05,
                      mywidth: 0.2),
                ],
              ),
            ),
            Divider(
              thickness: h * .005, // thickness of the line
              indent: 0, // empty space to the leading edge of divider.
              endIndent: 0, // empty space to the trailing edge of the divider.
              color: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              height: 0,
            ),
            SizedBox(
                height: h * .42,
                width: w * .01,
                child: CICard(
                    mycolor: Get.isDarkMode
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
              endIndent: 0, // empty space to the trailing edge of the divider.
              color: Get.isDarkMode
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
                  mycolor: Get.isDarkMode
                      ? Themes.customdarktheme.primaryColor
                      : Themes.customlighttheme.primaryColor,
                  title: 'Apply',
                  ontap: () {
                    Get.back();
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
    );
  }
}
