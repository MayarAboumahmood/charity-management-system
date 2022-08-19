import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/config/userinformation.dart';
import 'package:project_one/store/store.dart';
import '../../componant/button.dart';
import '../../componant/splash_pagview.dart';
import '../../const.dart';
import '../../size_config.dart';
import 'onboard_controller.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class OnBoardPAge extends StatelessWidget {
  OnBoardContoller controller = Get.put(OnBoardContoller());

  OnBoardPAge({Key? key}) : super(key: key);

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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: w * .1),
          children: [
            SizedBox(
              height: h * .05,
            ),
            AutoSizeText(
              tr("lets help student"),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Schyler",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode
                      ? Themes.customdarktheme.primaryColor
                      : Themes.customlighttheme.primaryColor),
            ),
            SizedBox(
              height: h * .05,
            ),
            SizedBox(
              height: h * .6,
              child: PageView.builder(
                  controller:
                      PageController(initialPage: controller.pageindex.value),
                  onPageChanged: (index) {
                    controller.pageindex(index);
                  },
                  itemCount: controller.pagedetals.length,
                  itemBuilder: (context, i) {
                    return SplashItem(
                        title: "${controller.pagedetals[i]['title']}",
                        image: "${controller.pagedetals[i]['image']}");
                  }),
            ),
            Column(children: [
              SizedBox(
                height: h * .02,
              ),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      controller.pagedetals.length,
                      (index) => buildDot(
                          index: index,
                          currentindex: controller.pageindex.value)),
                );
              }),
              SizedBox(
                height: h * .06,
              ),
              ContButton(
                myheight: .08,
                mywidth: .40,
                mycolor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                title: "Continue",
                ontap: () async {
                  Get.offAllNamed('/Login');
                },
              ),
            ]),
            SizedBox(
              height: h * .1,
            ),
          ],
        ),
      ),
    );
  }
}

AnimatedContainer buildDot({required int index, required int currentindex}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.all(5),
    height: 6,
    width: index == currentindex ? 20 : 6,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: index == currentindex
            ? Get.isDarkMode
                ? Themes.customdarktheme.primaryColor
                : Themes.customlighttheme.primaryColor
            : const Color(0xFFD8D8D8)),
  );
}
