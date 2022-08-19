import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class Drd extends StatelessWidget {
  String title;
  Drd({
    Key? key,
    required this.title,
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

    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: h * .002, // thickness of the line
            color: !Get.isDarkMode
                ? Themes.customdarktheme.primaryColor
                : Themes.customlighttheme.primaryColor,
            height: 0,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: w * .01),
          child: Text(
            tr(title),
            style: TextStyle(fontSize: w * .02, color: Colors.grey),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: h * .002, // thickness of the line
            color: !Get.isDarkMode
                ? Themes.customdarktheme.primaryColor
                : Themes.customlighttheme.primaryColor,
            height: 0,
          ),
        ),
      ],
    );
  }
}
