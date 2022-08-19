import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/config/userinformation.dart';
import 'package:project_one/screens/drawer/drawer.dart';
import '../../componant/warreentlycard.dart';
import '../../const.dart';
import '../../size_config.dart';
import 'warrenty_controller.dart';

class Warrenty extends StatelessWidget {
  Warrenty({Key? key}) : super(key: key);
  WarrentlyController controller = Get.find();
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
      drawer: const Drawer(child: DrawerPage()),
      floatingActionButton: UserInformation.usertype != "admin"
          ? FloatingActionButton.extended(
              onPressed: () {
                Get.toNamed('/ApplyWarrenty');
              },
              tooltip: 'Donation',
              backgroundColor: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              label: const Text('Apply').tr(),
            )
          : null,
      appBar: AppBar(
        title: Text(
          'Warrenty',
          style: TextStyle(
              fontFamily: 'Schyler', color: Colors.white, fontSize: w * .07),
        ).tr(),
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
            onPressed: () {
              // do something
            },
          )
        ],
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: w * .09,
            color: Colors.white,
            icon: const Icon(Icons.menu_rounded),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () {
            return controller.isload.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: Get.isDarkMode
                          ? Themes.customdarktheme.primaryColor
                          : Themes.customlighttheme.primaryColor,
                    ),
                  )
                : ListView.builder(
                    // physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: w * .05,
                      vertical: h * .01,
                    ),
                    itemCount: controller.model.length,
                    itemBuilder: (context, i) {
                      return WarrentyCard(
                        specialization: controller.model[i].specialization,
                        year: controller.model[i].year,
                        about: controller.model[i].about,
                        amount: controller.model[i].amount,
                        age: controller.model[i].age.toString(),
                        location: controller.model[i].location,
                        phone: controller.model[i].phone,
                        // pic: controller.model[i].pic,
                        status: controller.model[i].status,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
