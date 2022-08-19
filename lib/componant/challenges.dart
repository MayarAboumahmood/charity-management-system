import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/componant/linear_per_in.dart';
import '../const.dart';
import '../size_config.dart';
import 'button.dart';

// ignore: must_be_immutable
class ChallengesUnit extends StatelessWidget {
  late String title;
  late String imageName;
  late String about;
  late double aim;
  late String inDate;
  late String outDate;
  ChallengesUnit(
      {Key? key,
      required this.title,
      required this.inDate,
      required this.outDate,
      required this.imageName,
      required this.aim,
      required this.about})
      : super(key: key);
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

    return SizedBox(
      width: w * .94,
      height: h * .42,
      child: Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(w * .01, h * .008),
                  color: Colors.black26,
                  spreadRadius: w * .002,
                  blurRadius: w * .01)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(w * .03),
          ),
          width: w * .94,
          height: h * .4,
        ),
        SizedBox(
          width: w * .94,
          height: h * .34,
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(w * .03),
                topLeft: Radius.circular(w * .03),
                bottomRight: Radius.circular(w * .03),
                bottomLeft: Radius.circular(w * .03),
              ),
              child: Image.asset(imageName, fit: BoxFit.fitWidth)),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(w * .03),
              bottomRight: Radius.circular(w * .03),
              bottomLeft: Radius.circular(w * .03),
              topLeft: Radius.circular(w * .03),
            ), //MediaQuery.of(context).size.width * .03,
          ),
          width: w * .94,
          height: h * .34,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * .03),
                AutoSizeText(
                  tr(' $title'),
                  style: TextStyle(
                      fontSize: w * .05,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                SizedBox(height: h * .2),
                AutoSizeText(
                  ' ${tr('about')} :$about',
                  style: TextStyle(
                      fontSize: w * .04,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                  maxLines: 3,
                ),
              ]),
        ),
        Positioned(
          bottom: h * 0.0,
          child: Container(
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? Colors.black.withOpacity(0.7)
                  : Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(w * .03),
                topRight: !isportrai
                    ? Radius.circular(w * .03)
                    : Radius.circular(w * .0),
                bottomLeft: Radius.circular(w * .03),
              ),
            ),
            width: w * .9,
            height: h * .07,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: h * .355),
          child: AutoSizeText(
            ' X${tr('frome')} ${aim.toString()} \$',
            style: TextStyle(
                fontSize: w * .04,
                color: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                fontWeight: FontWeight.normal),
            maxLines: 3,
          ),
        ),
        Positioned(
          bottom: h * 0.02,
          child: LinearPerIn(
            percent: 70,
          ),
        ),
        Positioned(
          right: w * .01,
          bottom: h * -0.02,
          child: ContButton(
            myShadow: 0.008,
            myRadius: w * .1,
            myfontSize: w * .042,
            mycolor: Get.isDarkMode
                ? Themes.customdarktheme.primaryColor
                : Themes.customlighttheme.primaryColor,
            myheight: 0.059,
            mywidth: 0.3,
            ontap: () {
              Get.toNamed("Donat");
            },
            title: "Donate now",
          ),
        ),
      ]),
    );
  }
}
