import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class UserProfileTwoCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var valueOne;
  // ignore: prefer_typing_uninitialized_variables
  var valueTwo;
  final bool whitSdollarOne;
  final bool whitSdollarTwo;
  final String textOne;
  final String textTwo;

  UserProfileTwoCard(
      {Key? key,
      this.valueOne = 0,
      this.valueTwo = 0,
      this.whitSdollarOne = false,
      this.whitSdollarTwo = false,
      required this.textOne,
      required this.textTwo})
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
    return Row(
      children: [
        SizedBox(
          width: w * .03,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(w * .03),
              color: Get.isDarkMode
                  ? Themes.customdarktheme.secondaryHeaderColor
                  : Themes.customlighttheme.secondaryHeaderColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(w * .02),
                  child: Text(
                    whitSdollarOne ? "\$$valueOne" : "$valueOne",
                    style: TextStyle(
                        fontSize: w * .05,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: h * .03,
                ),
                Padding(
                  padding: EdgeInsets.all(w * .02),
                  child: AutoSizeText(
                    tr(textOne),
                    style: TextStyle(
                        fontSize: w * .05,
                        fontWeight: FontWeight.w200,
                        color: Colors.black),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: w * .03,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(w * .03),
              color: Get.isDarkMode
                  ? Themes.customdarktheme.secondaryHeaderColor
                  : Themes.customlighttheme.secondaryHeaderColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(w * .02),
                  child: Text(
                    whitSdollarTwo ? "\$$valueTwo" : "$valueTwo",
                    style: TextStyle(
                        fontSize: w * .05,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: h * .03,
                ),
                Padding(
                  padding: EdgeInsets.all(w * .02),
                  child: AutoSizeText(
                    tr(textTwo),
                    style: TextStyle(
                        fontSize: w * .05,
                        fontWeight: FontWeight.w200,
                        color: Colors.black),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: w * .03,
        ),
      ],
    );
  }
}
