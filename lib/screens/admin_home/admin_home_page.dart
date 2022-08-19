import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapping_page_scroll/snapping_page_scroll.dart';

import '../../componant/button.dart';
import '../../componant/menah_button.dart';
import '../../const.dart';
import '../../size_config.dart';
import '../drawer/drawer.dart';

class AdminHome extends StatelessWidget {
  final pagecontroller = PageController(
    viewportFraction: 0.75,
  );

  AdminHome({Key? key}) : super(key: key);
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
          tr('Admin home'),
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
              size: w * .09,
              color: Colors.white,
            ),
            onPressed: () {},
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
      body: SafeArea(
        child: Row(
          children: [
            if (!ismobile)
              const Expanded(
                child: DrawerPage(),
              ),
            Expanded(
              flex: 3,
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .05,
                ),
                children: [
                  SizedBox(
                    height: h * .02,
                  ),
                  ContButton(
                      myheight: .08,
                      mywidth: .28,
                      mycolor: //Theme.of(context).secondaryHeaderColor,
                          Get.isDarkMode
                              ? Themes.customdarktheme.secondaryHeaderColor
                              : Themes.customlighttheme.secondaryHeaderColor,
                      title: 'Beneficiary',
                      ontap: () {
                        Get.toNamed('/Beneficiary');
                      }),
                  SizedBox(
                    height: h * .02,
                  ),
                  ContButton(
                    myheight: .08,
                    mywidth: .28,
                    mycolor: Get.isDarkMode
                        ? Themes.customdarktheme.secondaryHeaderColor
                        : Themes.customlighttheme.secondaryHeaderColor,
                    title: 'statictic mangmant',
                    ontap: () {
                      Get.toNamed('/Statistics');
                    },
                  ),
                  SizedBox(
                    height: h * .05,
                  ),
                  const Divider(
                    thickness: 1, // thickness of the line
                    indent: 20, // empty space to the leading edge of divider.
                    endIndent:
                        20, // empty space to the trailing edge of the divider.
                    color: Color.fromARGB(255, 167, 169,
                        221), // The color to use when painting the line.
                    height: 0, // The divider's height extent.
                  ),
                  SizedBox(
                    height: h * .05,
                  ),
                  SizedBox(
                    height: h * .42,
                    width: w * .05,
                    child: SnappingPageScroll(
                      controller: pagecontroller,
                      children: [
                        MenahButton(
                          image: 'images/Warrenty.png',
                          mycolor: Get.isDarkMode
                              ? Themes.customdarktheme.secondaryHeaderColor
                              : Themes.customlighttheme.secondaryHeaderColor,
                          title: 'Warrenty',
                          ontap: () {
                            Get.toNamed('/Warrenty');
                          },
                        ),
                        MenahButton(
                          image: 'images/work.png',
                          mycolor: Get.isDarkMode
                              ? Themes.customdarktheme.secondaryHeaderColor
                              : Themes.customlighttheme.secondaryHeaderColor,
                          title: 'Training opportunity',
                          ontap: () {
                            Get.toNamed('/TrainingOpportunity');
                          },
                        ),
                        MenahButton(
                          image: 'images/scolarship.png',
                          mycolor: Get.isDarkMode
                              ? Themes.customdarktheme.secondaryHeaderColor
                              : Themes.customlighttheme.secondaryHeaderColor,
                          title: 'Scoleerchape',
                          ontap: () {
                            Get.toNamed('/Scoraleerchape');
                          },
                        ),
                        MenahButton(
                          image: 'images/stude_zone.png',
                          mycolor: Get.isDarkMode
                              ? Themes.customdarktheme.secondaryHeaderColor
                              : Themes.customlighttheme.secondaryHeaderColor,
                          title: 'Study zones',
                          ontap: () {
                            Get.toNamed('/Studyzone');
                          },
                        ),
                        MenahButton(
                          image: 'images/work.png',
                          mycolor: Get.isDarkMode
                              ? Themes.customdarktheme.secondaryHeaderColor
                              : Themes.customlighttheme.secondaryHeaderColor,
                          title: 'work',
                          ontap: () {
                            Get.toNamed('/jobOpportunity');
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * .05,
                  ),
                  const Divider(
                    thickness: 1, // thickness of the line
                    indent: 20, // empty space to the leading edge of divider.
                    endIndent:
                        20, // empty space to the trailing edge of the divider.
                    color: Color.fromARGB(255, 167, 169,
                        221), // The color to use when painting the line.
                    height: 0, // The divider's height extent.
                  ),
                  SizedBox(
                    height: h * .05,
                  ),
                  ContButton(
                      myheight: .08,
                      mywidth: .28,
                      mycolor: Get.isDarkMode
                          ? Themes.customdarktheme.secondaryHeaderColor
                          : Themes.customlighttheme.secondaryHeaderColor,
                      title: 'challenges',
                      ontap: () {
                        Get.toNamed('/Challenges');
                      }),
                  SizedBox(
                    height: h * .02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/Charity_profile");
                    },
                    child: Container(
                      width: w * .9,
                      height: h * .09,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? Themes.customdarktheme.secondaryHeaderColor
                            : Themes.customlighttheme.secondaryHeaderColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(w * .01),
                            child: Container(
                              width: w * .2,
                              height: h * .08,
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('images/onboard1.jpg'),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w * .1,
                          ),
                          AutoSizeText(
                            tr('charity profile'),
                            style: TextStyle(
                                fontSize: h * .025,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * .05,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
