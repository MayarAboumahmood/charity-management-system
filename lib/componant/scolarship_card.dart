import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/config/userinformation.dart';
import '../config/size_config.dart';
import '../const.dart';
import 'button.dart';

// ignore: must_be_immutable
class ScoalrShipCard extends StatelessWidget {
  String maxNumber;
  String acadimacYear;
  String description;
  String collage;
  ScoalrShipCard({
    Key? key,
    required this.maxNumber,
    required this.acadimacYear,
    required this.description,
    required this.collage,
  }) : super(key: key);

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * .025),
      child: SizedBox(
        width: w * .8,
        height: h * .3,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: w * .03),
              width: w * .9,
              height: h * .3,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(w * .01, h * .01),
                      blurRadius: w * .03),
                ],
                color: Get.isDarkMode
                    ? Themes.customdarktheme.secondaryHeaderColor
                    : Themes.customlighttheme.secondaryHeaderColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(w * .2),
                  bottomLeft: Radius.circular(w * .05),
                  topLeft: Radius.circular(w * .05),
                  bottomRight: Radius.circular(w * .05),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * .02,
                  ),
                  Text(
                    "${tr("collage")} : $collage",
                    style: TextStyle(fontSize: w * .04, color: Colors.white),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Text(
                    "ِ${tr("Max Number")}: $maxNumber",
                    style: TextStyle(fontSize: w * .04, color: Colors.white),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Text(
                    "${tr("Acadymic year")} : $acadimacYear",
                    style: TextStyle(fontSize: w * .04, color: Colors.white),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Text(
                    '${tr("Description")} : $description',
                    style: TextStyle(fontSize: w * .03, color: Colors.white),
                  ),
                ],
              ),
            ),
            UserInformation.usertype == 'user'
                ? Positioned(
                    bottom: h * -0.03,
                    right: w * .05,
                    child: ContButton(
                      myShadow: 0.008,
                      myRadius: w * .1,
                      myfontSize: w * .042,
                      mycolor: Get.isDarkMode
                          ? Themes.customdarktheme.primaryColor
                          : Themes.customlighttheme.primaryColor,
                      myheight: 0.059,
                      mywidth: 0.2,
                      ontap: () {
                        Get.offNamed('/ApplayScolarShip');
                      },
                      title: tr("apply "),
                    ),
                  )
                : const Positioned(child: Text('')),
            Positioned(
              top: h * .02,
              right: w * .05,
              child: Container(
                height: h * .1,
                width: w * .23,
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: w * .005),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('images/onboard1.jpg'),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
