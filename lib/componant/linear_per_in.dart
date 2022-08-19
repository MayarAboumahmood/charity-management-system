import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../const.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class LinearPerIn extends StatelessWidget {
  double percent;
  LinearPerIn({Key? key, required this.percent}) : super(key: key);

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
      width: w * .55,
      child: LinearPercentIndicator(
        lineHeight: h * .015,
        animation: true,
        animationDuration: 700,
        percent: percent / 100,
        progressColor: Get.isDarkMode
            ? Themes.customdarktheme.primaryColor
            : Themes.customlighttheme.primaryColor,
        backgroundColor: const Color.fromARGB(255, 180, 206, 209),
        center: AutoSizeText(
          '$percent % ',
          style: TextStyle(color: Colors.white, fontSize: w * .018),
        ),
      ),
    );
  }
}
