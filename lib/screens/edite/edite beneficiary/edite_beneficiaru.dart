import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../componant/button.dart';
import '../../../componant/drd.dart';
import '../../../componant/mayar_textfield.dart';
import '../../../const.dart';
import '../../../size_config.dart';
import '../../drawer/drawer.dart';
import 'edite_beneficiary_controller.dart';

class EditBeneficiary extends StatelessWidget {
  EditBeneficiary({Key? key}) : super(key: key);
  EditBeneficiaryController controller = Get.find();
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
          'job opportunity',
          style: TextStyle(
              fontFamily: 'Schyler', color: Colors.white, fontSize: w * .06),
        ).tr(),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
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
            iconSize:
                w * .09, //-----------------------------------------------------
            color: Colors.white,
            icon: const Icon(Icons.menu_rounded),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: SafeArea(
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
              disableColor: primaryColor,
              enableColor: Colors.black45,
              hintText: 'Name',
              labletext: 'Name',
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
              initvalue: controller.age,
              textType: TextInputType.name,
              scurtext: false,
              disableColor: primaryColor,
              enableColor: Colors.black45,
              hintText: 'age',
              labletext: 'age',
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
            Drd(
              title: 'Location info',
            ),
            SizedBox(
              height: h * .02,
            ),
            Mytextfield(
              textType: TextInputType.name,
              scurtext: false,
              disableColor: primaryColor,
              enableColor: Colors.black45,
              hintText: 'location ',
              labletext: 'location',
              onsave: (value) {
                controller.location = value ?? "";
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
              disableColor: primaryColor,
              enableColor: Colors.black45,
              hintText: 'Phone',
              labletext: 'Contact phone',
              onsave: (value) {
                controller.phone = value ?? "";
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
              initvalue: controller.reasonForAccepted,
              textType: TextInputType.name,
              scurtext: false,
              disableColor: primaryColor,
              enableColor: Colors.black45,
              hintText: 'Reason for accepted',
              labletext: 'About',
              onsave: (value) {
                controller.reasonForAccepted = value ?? "";
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
              initvalue: controller.reasonForAccepted,
              textType: TextInputType.number,
              scurtext: false,
              disableColor: primaryColor,
              enableColor: Colors.black45,
              hintText: 'amount',
              labletext: 'amount',
              onsave: (value) {
                controller.amount = value ?? '0';
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
    );
  }
}
