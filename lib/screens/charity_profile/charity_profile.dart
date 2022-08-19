import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../componant/button.dart';
import '../../componant/splash_pagview.dart';
import '../../componant/statistc_item.dart';
import '../../const.dart';
import '../../size_config.dart';
import '../drawer/drawer.dart';
import 'charity_profile_conntroller.dart';

// ignore: must_be_immutable
class CharityProfile extends StatelessWidget {
  CharityProfileController controller = Get.find();

  CharityProfile({Key? key}) : super(key: key);
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
        drawer: ismobile ? const Drawer(child: DrawerPage()) : null,
        appBar: AppBar(
          title: AutoSizeText(
            tr("charity profile"),
            style: const TextStyle(
              fontFamily: 'Schyler',
              color: Colors.white,
            ),
          ),
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
          leading: ismobile
              ? Builder(
                  builder: (context) => IconButton(
                    iconSize: w * .09,
                    color: Colors.white,
                    icon: const Icon(Icons.menu_rounded),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                )
              : null,
        ),
        // if(!ismobile)Expanded(child: DrawerPage(),),

        body: Obx(() {
          return controller.isload.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: Get.isDarkMode
                        ? Themes.customdarktheme.primaryColor
                        : Themes.customlighttheme.primaryColor,
                  ),
                )
              : Row(
                  children: [
                    if (!ismobile)
                      const Expanded(
                        child: DrawerPage(),
                      ),
                    Expanded(
                      flex: 3,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: h * .07,
                          ),
                          Container(
                            width: w * .3,
                            height: h * .2,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3,
                                  color: Get.isDarkMode
                                      ? Themes.customdarktheme.primaryColor
                                      : Themes.customlighttheme.primaryColor),
                              image: const DecorationImage(
                                image: AssetImage('images/onboard1.jpg'),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            height: h * .04,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              // tr("The charity name"),
                              tr("sanad"),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Get.isDarkMode
                                    ? Themes
                                        .customdarktheme.secondaryHeaderColor
                                    : Themes
                                        .customlighttheme.secondaryHeaderColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * .05,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * .08),
                            child: AutoSizeText(
                              controller.model[0].theImportantInfo,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              maxLines: 6,
                              minFontSize: 10,
                            ),
                          ),
                          SizedBox(
                            height: h * .04,
                          ),
                          Divider(
                            thickness: h * .002, // thickness of the line
                            color: Get.isDarkMode
                                ? Themes.customdarktheme.primaryColor
                                : Themes.customlighttheme.primaryColor,
                            height: 0,
                          ),
                          SizedBox(
                            height: h * .02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * .08),
                            child: AutoSizeText(
                              tr("More details baout the charity:"),
                              style: TextStyle(
                                color:
                                    Get.isDarkMode ? lowWhite : Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * .02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Statistc_item(
                                  type: "Beneficiary",
                                  amount: controller.model[0].beneficiaryNum,
                                  color: Colors.red,
                                ),
                              ),
                              Expanded(
                                child: Statistc_item(
                                  type: "Donater",
                                  amount: controller.model[0].beneficiaryNum,
                                  color: Colors.purpleAccent,
                                ),
                              ),
                              Expanded(
                                child: Statistc_item(
                                  type: "Challenges",
                                  amount: controller.model[0].challengesNum,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * .05,
                          ),

                          // start image about charity
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: w * .08),
                            height: h * .55,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: PageView.builder(
                                    controller: PageController(
                                        initialPage:
                                            controller.pageindex.value),
                                    onPageChanged: (index) {
                                      controller.pageindex(index);
                                    },
                                    itemCount: controller.pagedetals.length,
                                    itemBuilder: (context, i) {
                                      return SplashItemProfile(
                                          image:
                                              "${controller.pagedetals[i]['image']}");
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Obx(
                                    () {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                            controller.pagedetals.length,
                                            (index) => buildDot(
                                                index: index,
                                                currentindex: controller
                                                    .pageindex.value)),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //end images
                          SizedBox(
                            height: h * .02,
                          ),

                          SizedBox(
                            height: h * .03,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * .2),
                            child: ContButton(
                              myheight: 0.07,
                              mywidth: 0.3,
                              mycolor: Get.isDarkMode
                                  ? Themes.customdarktheme.primaryColor
                                  : Themes.customlighttheme.primaryColor,
                              ontap: () {
                                Get.toNamed('/Donat');
                              },
                              title: "Support Us",
                            ),
                          ),
                          SizedBox(
                            height: h * .02,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        }));
  }
}

AnimatedContainer buildDot({required int index, required int currentindex}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    height: 6,
    width: index == currentindex ? 20 : 6,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: index == currentindex ? Colors.orange : const Color(0xFFD8D8D8)),
  );
}
