import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../const.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class TrendingCard extends StatelessWidget {
  String name;
  double gool;
  double performance;
  String inDate;
  String ranking;
  TrendingCard(
      {Key? key,
      required this.gool,
      required this.ranking,
      required this.inDate,
      required this.performance,
      required this.name,})
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

    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Center(
            child: Container(
              width: w * .85,
              height: h * .2,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(w * .005, h * .003),
                      color: Colors.black12,
                      spreadRadius: w * .002,
                      blurRadius: w * .01)
                ],
                borderRadius: BorderRadius.circular(
                  w * .02,
                ),
                color: Get.isDarkMode
                    ? Themes.customdarktheme.secondaryHeaderColor
                    : Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    tr(' $name'),
                    style: TextStyle(
                        fontSize: w * .05,
                        color: Get.isDarkMode
                            ? Themes.customdarktheme.primaryColor
                            : Themes.customlighttheme.primaryColor,
                        //  ranking == 'images/gold.png'
                        //     ? thegoldColor
                        //     : ranking == 'images/selvar.png'
                        //         ? theselvarColor
                        //         : thebronzColor,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: h * .01,
                  ),
                  Row(
                    children: [
                      AutoSizeText(
                        ' ${tr('the aim is')} $gool \$',
                        style: TextStyle(
                            fontSize: w * .05,
                            color: Get.isDarkMode
                                ? Themes.customdarktheme.primaryColor
                                : Themes.customlighttheme.primaryColor,
                            //  ranking == 'images/gold.png'
                            //     ? thegoldColor
                            //     : ranking == 'images/selvar.png'
                            //         ? theselvarColor
                            //         : thebronzColor,

                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                      SizedBox(
                        width: w * .34,
                        child: CircularPercentIndicator(
                          circularStrokeCap: CircularStrokeCap.round,
                          lineWidth: w * .03,
                          animation: true,
                          animationDuration: 700,
                          percent: performance / 100,
                          progressColor: Get.isDarkMode
                              ? Themes.customdarktheme.primaryColor
                              : Themes.customlighttheme.primaryColor,
                          //  ranking == 'images/gold.png'
                          //     ? thegoldColor
                          //     : ranking == 'images/selvar.png'
                          //         ? theselvarColor
                          //         : thebronzColor,

                          backgroundColor:
                              const Color.fromARGB(255, 180, 206, 209),
                          center: Text(
                            '$performance % ',
                            style: TextStyle(
                              color: Get.isDarkMode
                                  ? Themes.customdarktheme.primaryColor
                                  : Themes.customlighttheme.primaryColor,
                              //  ranking == 'images/gold.png'
                              //     ? thegoldColor
                              //     : ranking == 'images/selvar.png'
                              //         ? theselvarColor
                              //         : thebronzColor,
                            ),
                          ).tr(),
                          radius: w * .22,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: w * .01,
                  ),
                  AutoSizeText(
                    '${tr(' created on')} :$inDate',
                    style: TextStyle(
                        fontSize: w * .045,
                        color: Get.isDarkMode
                            ? Themes.customdarktheme.primaryColor
                            : Themes.customlighttheme.primaryColor,
                        //  ranking == 'images/gold.png'
                        //     ? thegoldColor
                        //     : ranking == 'images/selvar.png'
                        //         ? theselvarColor
                        //         : thebronzColor,

                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: w * .72,
            top: h * -0.02,
            child: SizedBox(
                width: w * .15,
                height: h * .15,
                child: Image.asset(
                  '$ranking',
                  fit: BoxFit.contain,
                )),
          ),
        ],
      ),
    );
  }
}
