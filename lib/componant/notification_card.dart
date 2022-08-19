import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const.dart';
import '../size_config.dart';
import 'button.dart';
import 'gridview_card.dart';

// ignore: must_be_immutable
class ScNotifiacationCard extends StatelessWidget {
  String scname;
  String username;
  String universityname;
  late String about;
  late bool isscolar;
  String specialization;
  String year;
  String amount;

  ScNotifiacationCard(
      {Key? key,
      this.amount = '0',
      this.year = 'first years',
      this.specialization = 'IT',
      this.scname = '',
      required this.isscolar,
      this.universityname = 'Damascuse',
      this.username = 'anomynios',
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

    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * .03),
      child: SizedBox(
        width: w,
        height: h * .6,
        child: Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
          Container(
            width: w,
            height: h * .35,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(w * .01, h * .008),
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 8)
                ],
                color: Get.isDarkMode
                    ? Themes.customdarktheme.secondaryHeaderColor
                    : Themes.customlighttheme.secondaryHeaderColor,
                borderRadius: BorderRadius.all(Radius.circular(w * .03))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      isscolar
                          ? '${tr('Scolarship Name:')} $scname'
                          : '${tr('Student Name:')}$username',
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      isscolar
                          ? '${tr('University Name:')} $universityname'
                          : '${tr('Specialization:')} $specialization',
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      isscolar
                          ? '${tr('Student Name:')} $username'
                          : '${tr('Academic year:')} $year',
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                  !isscolar
                      ? Padding(
                          padding: EdgeInsets.all(w * .02),
                          child: AutoSizeText(
                            '${tr('Amount per month:')} $amount\$',
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                            maxLines: 1,
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      '${tr('About the Student:')} $about',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      maxLines: 4,
                    ),
                  ),
                  SizedBox(
                    height: h * .05,
                  ),
                  Center(
                    child: SizedBox(
                      height: isportrai ? h * .215 : h * .225,
                      width: isportrai ? w * .92 : h * .92,
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isportrai ? 2 : 4,
                          crossAxisSpacing: w * .02,
                          mainAxisSpacing: w * .02,
                        ),
                        children: const [
                          GridViewCard(
                            imagename: 'images/onboard1.jpg',
                          ),
                          GridViewCard(
                            imagename: 'images/onboard2.jpg',
                          ),
                          GridViewCard(
                            imagename: 'images/onboard3.jpg',
                          ),
                          GridViewCard(
                            imagename: 'images/onboard4.jpg',
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
          ),
          Positioned(
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
              mywidth: 0.35,
              ontap: () {},
              title: "Approval",
            ),
          ),
          Positioned(
            bottom: h * -0.03,
            left: w * .05,
            child: ContButton(
              myShadow: 0.008,
              myRadius: w * .1,
              myfontSize: w * .042,
              mycolor: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              myheight: 0.059,
              mywidth: 0.35,
              ontap: () {},
              title: "Decline",
            ),
          ),
        ]),
      ),
    );
  }
}
