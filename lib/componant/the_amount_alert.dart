// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_one/componant/button.dart';
import 'package:project_one/componant/donat_text_field.dart';
import 'package:project_one/screens/donat/donation_controller.dart';

import '../../const.dart';
import '../../size_config.dart';

class AmountAlert extends StatelessWidget {
  late String amount;

  // DonationController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    bool ismobile = isMobile(context);
    bool isportrai = isPortrait(context);
    double h /*, w*/;
    if (isportrai) {
      h = MediaQuery.of(context).size.height;
      // w = MediaQuery.of(context).size.width;
    } else {
      // w = MediaQuery.of(context).size.height;
      h = MediaQuery.of(context).size.width;
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: h * .45, top: h * .05),
        child: AlertDialog(
          backgroundColor: !Get.isDarkMode
              ? Themes.customdarktheme.backgroundColor
              : Themes.customlighttheme.backgroundColor,
          // buttonPadding: ,
          title: Text(tr('Your amount'),
              style: TextStyle(
                  color: !Get.isDarkMode
                      ? Themes.customdarktheme.primaryColor
                      : Themes.customlighttheme.primaryColor)),
          content: Column(
            children: [
              Text(
                tr('Pleas enter the custom amount that you want to donate.'),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w200),
              ),
              SizedBox(
                height: h * .05,
              ),
              DonatTextField(
                onsave: (Value) {
                  amount = Value;
                },
                symmetricPaddingLeft: 0.05,
                symmetricPaddingRight: 0.05,
                textType: TextInputType.number,
                scurtext: false,
                disableColor: !Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: !Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                hintText: 'Your amount',
                suffixIcon: const Icon(Icons.attach_money),
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
                child: ContButton(
                    mycolor: !Get.isDarkMode
                        ? Themes.customdarktheme.primaryColor
                        : Themes.customlighttheme.primaryColor,
                    title: 'Confirm',
                    ontap: () {
                      // controller.dAmount = amount;
                      Get.back();
                    },
                    myheight: 0.1,
                    mywidth: 6))
          ],
        ),
      ),
    );
  }
}
