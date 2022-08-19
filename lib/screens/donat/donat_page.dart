import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/screens/donat/donation_controller.dart';
import '../../componant/button.dart';
import '../../componant/the_amount_alert.dart';
import '../../const.dart';
import '../../size_config.dart';

class DonatPage extends StatelessWidget {
  DonatPage({Key? key}) : super(key: key);
  // DonationController controller = Get.find();
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
      backgroundColor: Get.isDarkMode
          ? Themes.customdarktheme.backgroundColor
          : Themes.customlighttheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: h * .42,
                  width: w,
                  child: Stack(
                    children: [
                      Positioned(
                        top: h * -0.2,
                        child: Container(
                          height: h * .5,
                          width: isportrai ? w : h,
                          decoration: BoxDecoration(
                              color: Get.isDarkMode
                                  ? Themes.customdarktheme.primaryColor
                                  : Themes.customlighttheme.primaryColor,
                              borderRadius: BorderRadius.circular(w * .5)),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: h * .05,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => AmountAlert(),
                                  barrierDismissible: true);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '\$2600',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 228, 220, 220),
                                      fontSize: w * .1),
                                ),
                                const Icon(Icons.edit,
                                    color: Color.fromARGB(255, 228, 220, 220)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * .3,
                            width: w * .4,
                            child: ClipRRect(
                              child: Image.asset(
                                'images/stack_of_money.png',
                                height: h * .4,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(left: w * .05),
                child: Text(
                  "Payment  methods",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: w * .05),
                ).tr(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .05),
                child: Divider(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(
                height: h * .005,
              ),
              Padding(
                padding: EdgeInsets.only(left: w * .05),
                child: Row(
                  children: [
                    SizedBox(
                      width: w * .05,
                    ),
                    Text(
                      "No payment method connected",
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: w * .04,
                          fontWeight: FontWeight.w200),
                    ).tr(),
                    SizedBox(
                      width: w * .05,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/AddCreditCard');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            size: w * .07,
                          ),
                          Text(
                            'Add',
                            style: TextStyle(
                                fontSize: w * .05,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ).tr(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * .005,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .05),
                child: Divider(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(
                height: h * .3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .05),
                child: ContButton(
                    mycolor: Get.isDarkMode
                        ? Themes.customdarktheme.primaryColor
                        : Themes.customlighttheme.primaryColor,
                    title: "Done",
                    ontap: () {
                      Get.back();
                    },
                    myheight: 0.08,
                    mywidth: 4),
              )
            ],
          ),
        ),
      ),
    );
  }
}
