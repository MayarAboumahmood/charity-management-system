import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/componant/user_profile_two_card.dart';
import 'package:project_one/const.dart';
import 'package:project_one/screens/user_profile/user_profile_controller.dart';
import 'package:project_one/size_config.dart';

class UserProfile extends StatelessWidget {
  UserProfileController controller = Get.find();
  UserProfile({
    Key? key,
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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(child: Obx(() {
        return controller.isload.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Get.isDarkMode
                      ? Themes.customdarktheme.primaryColor
                      : Themes.customlighttheme.primaryColor,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: w * .03),
                          child: Text(
                            "Profile",
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: w * .045,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.settings,
                            size: w * .07,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                          onPressed: () {
                            // do something
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * .05,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w * .02,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: w * .32,
                            height: h * .11,
                            alignment: Alignment.bottomCenter,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/colleg1.jfif'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * .01,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: h * .06),
                              child: Text(
                                'mayar',
                                style: TextStyle(
                                    fontSize: w * .05,
                                    fontWeight: FontWeight.w500,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black),
                              ).tr(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: h * .0),
                              child: Text(
                                "We will help syudent togather!",
                                style: TextStyle(
                                    fontSize: w * .03,
                                    fontWeight: FontWeight.w300,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black),
                              ).tr(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * .13,
                    ),
                    UserProfileTwoCard(
                      textOne: 'Total donations',
                      valueOne: '0',
                      whitSdollarOne: true,
                      textTwo: "Login date",
                      valueTwo: '2022-12-8',
                    ),
                    SizedBox(
                      height: h * .02,
                    ),
                    UserProfileTwoCard(
                      valueTwo: '0',
                      textOne: '',
                      textTwo: "Total challenges",
                      whitSdollarTwo: true,
                    ),
                    Divider(
                      height: h * .1,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      thickness: h * .0005,
                    ),
                    Padding(
                      padding: EdgeInsets.all(w * .05),
                      child: Text(
                        'المفروض نحط هون اشياء مشان اذا كان طالب او لا واذا كان منحط معلومات عنو',
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                      ),
                    )
                  ],
                ),
              );
      })),
    );
  }
}
