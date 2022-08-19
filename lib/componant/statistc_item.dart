import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const.dart';
import '../size_config.dart';

// ignore: camel_case_types
class Statistc_item extends StatelessWidget {
  String type;
  String amount;
  Color color;
  Statistc_item({
    Key? key,
    required this.type,
    required this.amount,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isportrai = isPortrait(context);
    double h, w;
    if (isportrai) {
      h = MediaQuery.of(context).size.height;
      w = MediaQuery.of(context).size.width;
    } else {
      w = MediaQuery.of(context).size.height;
      h = MediaQuery.of(context).size.width;
    }
    return Container(
      height: h * .11,
      margin: EdgeInsets.all(
        w * .02,
      ),
      padding: EdgeInsets.all(
        w * .02,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            tr(type),
            style: TextStyle(
              color: Get.isDarkMode ? lowWhite : Colors.white,
              // fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          AutoSizeText(
            amount,
            style: TextStyle(
              color: Get.isDarkMode ? lowWhite : Colors.white,
              //  fon tSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            minFontSize: 20,
          ),
        ],
      ),
    );
  }
}
