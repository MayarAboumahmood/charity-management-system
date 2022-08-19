import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/config/userinformation.dart';
import 'package:project_one/screens/drawer/drawer.dart';
import '../../componant/study_zone_card.dart';
import '../../const.dart';
import '../../size_config.dart';
import 'studyZone_controller.dart';

class StudyZonesPage extends StatelessWidget {
  StudyZonesPage({Key? key}) : super(key: key);
  StudyZoneController controller = Get.find();
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
      floatingActionButton: UserInformation.usertype == "admin"
          ? FloatingActionButton(
              onPressed: () {
                Get.toNamed('/Add_study');
              },
              backgroundColor: Get.isDarkMode
                  ? Themes.customdarktheme.primaryColor
                  : Themes.customlighttheme.primaryColor,
              child: const Icon(Icons.add),
            )
          : null,
      drawer: const Drawer(child: DrawerPage()),
      appBar: AppBar(
        title: Text(
          'Study zones',
          style: TextStyle(
              fontFamily: "Schyler", color: Colors.white, fontSize: w * .07),
        ).tr(),
        elevation: 0,
        backgroundColor: Get.isDarkMode
            ? Themes.customdarktheme.primaryColor
            : Themes.customlighttheme.primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: w * .08,
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
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      vertical: h * .02,
                    ),
                    itemCount: controller.model.length,
                    itemBuilder: (context, i) {
                      return StudyZoneCard(
                        ontap: () {
                          Get.toNamed('/EditStudy',
                              arguments: controller.model[i]);
                        },
                        name: controller.model[i].name,
                        description: controller.model[i].description,
                        available_times: controller.model[i].availableTimes,
                        location: controller.model[i].location,
                        phone: controller.model[i].phone,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
