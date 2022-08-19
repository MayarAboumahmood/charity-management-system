import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../config/userinformation.dart';
import '../../size_config.dart';
import 'package:easy_localization/easy_localization.dart';

import 'drawer_controller.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

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
      // backgroundColor: !Get.isDarkMode
      //                     ? Themes.customdarktheme.backgroundColor
      //                     : Themes.customlighttheme.primaryColor,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(w * .05),
              bottomRight: Radius.circular(w * .05)),
        ),
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                "images/onboard1.jpg",
                width: w,
                height: h * 0.25,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: h * .03,
            ),
            UserInformation.usertype != "admin"
                ? DrawerEl(
                    ontap: () {
                      Get.toNamed('/UserProfile');
                    },
                    title: "Profile",
                    icon: Icons.person,
                  )
                : const Text(''),
            UserInformation.usertype == "admin"
                ? DrawerEl(
                    ontap: () {
                      Get.toNamed('/Notification');
                    },
                    title: "Notification",
                    icon: Icons.notifications,
                  )
                : const Text(''),
            // SizedBox(
            //   height: h * .03,
            // ),
            DrawerEl(
                title: "Setting",
                icon: Icons.settings,
                ontap: () {
                  Get.toNamed(
                    '/setting',
                  );
                }),
            // SizedBox(
            //   height: h * .03,
            // ),
            DrawerEl(title: "Contact Us", icon: Icons.email_rounded),
            // SizedBox(
            //   height: h * .03,
            // ),
            DrawerEl(title: "About Us", icon: Icons.info),
            // SizedBox(
            // height: h * .03,
            //  ),
            DrawerEl(
              title: "Log Out",
              icon: Icons.logout,
              ontap: () {
                clickLogout();
              },
            ),
          ],
        ),
      ),
    );
  }

  clickLogout() async {
    LogoutController controller = Get.put(LogoutController());
    EasyLoading.show(status: 'loading ...');
    await controller.doLogout();
    if (controller.logoutstate) {
      EasyLoading.showSuccess("controller.message");
      Get.offAllNamed('/login');
    } else {
      EasyLoading.showError('controller.message');
    }
  }
}

// ignore: must_be_immutable
class DrawerEl extends StatelessWidget {
  String title;
  Function()? ontap;
  IconData icon;
  DrawerEl({
    Key? key,
    required this.title,
    required this.icon,
    this.ontap,
  }) : super(key: key);
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
    return GestureDetector(
        child: Card(
          margin: EdgeInsets.only(top: h * .02, bottom: w * .02),
          child: ListTile(
            leading: Icon(
              icon,
              size: w * .055,
              //   color: primaryColor,
            ),
            title: AutoSizeText(
              tr(title),
              style: TextStyle(
                fontSize: w * .04,
                fontWeight: FontWeight.w600,
                //   color: primaryColor
              ),
            ),
          ),
        ),
        onTap: ontap);
  }
}
