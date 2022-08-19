import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/userinformation.dart';
import '../const.dart';
import '../size_config.dart';
import 'button.dart';

// ignore: must_be_immutable
class StudyZoneCard extends StatelessWidget {
  late String name;
  late String location;
  late String description;
  late String available_times;
  late String phone;
  Function() ontap;

  StudyZoneCard({
    Key? key,
    required this.name,
    required this.ontap,
    required this.location,
    required this.description,
    required this.available_times,
    required this.phone,
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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * .02, vertical: h * .04),
      child: SizedBox(
        width: w * .94,
        height: h * .28,
        child: Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
          Container(
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
            width: w * .94,
            height: h * .25,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      '${tr('study zone Name')} :$name .',
                      style: TextStyle(fontSize: w * .04, color: Colors.white),
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      '${tr('Phone')} :$phone .',
                      style: TextStyle(fontSize: w * .04, color: Colors.white),
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      '${tr(' location :')}$location .',
                      style: TextStyle(fontSize: w * .04, color: Colors.white),
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      tr(available_times),
                      style: TextStyle(fontSize: w * .04, color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      '${tr('description')}:$description',
                      style: TextStyle(fontSize: w * .04, color: Colors.white),
                      maxLines: 1,
                    ),
                  )
                ]),
          ),
          UserInformation.usertype == "admin"
              ? Positioned(
                  bottom: h * -0.02,
                  right: w * .05,
                  child: ContButton(
                    myShadow: 0.008,
                    myRadius: w * .1,
                    myfontSize: w * .042,
                    mycolor: Get.isDarkMode
                        ? Themes.customdarktheme.primaryColor
                        : Themes.customlighttheme.primaryColor,
                    myheight: 0.059,
                    mywidth: 0.2,
                    ontap: ontap,
                    title: "edite",
                  ),
                )
              : const Positioned(child: Text("")),
        ]),
      ),
    );
  }
}
