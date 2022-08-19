// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const.dart';
import '../size_config.dart';
import 'button.dart';

class DecImageAlert extends StatelessWidget {
  final String imagename;
  const DecImageAlert({
    Key? key,
    required this.imagename,
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: h * .3, top: h * .05),
        child: AlertDialog(
          content: SizedBox(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(w * .01),
            child: Image.asset(imagename, fit: BoxFit.fill),
          )),
          actions: [
            CupertinoDialogAction(
              child: ContButton(
                mycolor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                title: 'Done',
                ontap: () {
                  Get.back();
                },
                myheight: 0.1,
                mywidth: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
