import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/componant/button.dart';
import 'package:project_one/componant/donat_text_field.dart';
import '../../const.dart';
import '../../size_config.dart';

class AddCreditCard extends StatelessWidget {
  const AddCreditCard({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: h * .02,
              ),
              Text(
                'Add a credit / debit card',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: w * .07,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
              SizedBox(
                height: h * .01,
              ),
              DonatTextField(
                symmetricPaddingLeft: 0.05,
                symmetricPaddingRight: 0.05,
                suffixIcon: const Icon(Icons.credit_card),
                textType: TextInputType.number,
                scurtext: false,
                disableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                enableColor: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Themes.customlighttheme.primaryColor,
                hintText: 'card number',
              ),
              SizedBox(
                height: h * .01,
              ),
              Row(
                children: [
                  Flexible(
                    child: DonatTextField(
                      symmetricPaddingLeft: 0.05,
                      symmetricPaddingRight: 0.01,
                      textType: TextInputType.number,
                      scurtext: false,
                      disableColor: Get.isDarkMode
                          ? Themes.customdarktheme.primaryColor
                          : Themes.customlighttheme.primaryColor,
                      enableColor: Get.isDarkMode
                          ? Themes.customdarktheme.primaryColor
                          : Themes.customlighttheme.primaryColor,
                      hintText: 'Expiration date',
                    ),
                  ),
                  Flexible(
                    child: DonatTextField(
                      symmetricPaddingLeft: 0.01,
                      symmetricPaddingRight: 0.05,
                      textType: TextInputType.number,
                      scurtext: false,
                      disableColor: Get.isDarkMode
                          ? Themes.customdarktheme.primaryColor
                          : Themes.customlighttheme.primaryColor,
                      enableColor: Get.isDarkMode
                          ? Themes.customdarktheme.primaryColor
                          : Themes.customlighttheme.primaryColor,
                      hintText: 'CVC',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * .03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .05),
                child: ContButton(
                    myRadius: 5,
                    myfontSize: w * .037,
                    mycolor: Get.isDarkMode
                        ? Themes.customdarktheme.primaryColor
                        : Themes.customlighttheme.primaryColor,
                    title: 'Save payment method',
                    ontap: () {
                      Get.back();
                    },
                    myheight: 0.05,
                    mywidth: 4),
              )
            ],
          ),
        ),
      ),
    );
  }
}
