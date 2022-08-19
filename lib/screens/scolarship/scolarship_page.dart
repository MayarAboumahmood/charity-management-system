import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/config/userinformation.dart';
import 'package:project_one/screens/scolarship/scolarship_contoller.dart';
import '../../componant/scolarship_card.dart';
import '../../config/size_config.dart';
import '../../const.dart';
import '../drawer/drawer.dart';

class ScolarShipPage extends StatelessWidget {
  ScolarShipController controller = Get.find();
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
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton:UserInformation.usertype=="admin"? FloatingActionButton(
        onPressed: () {
          Get.toNamed('/Add_scolarship');
        },
        backgroundColor: Get.isDarkMode
            ? Themes.customdarktheme.primaryColor
            : Themes.customlighttheme.primaryColor,
        child: const Icon(Icons.add),
      ):null,
      drawer: const Drawer(
        child: DrawerPage(),
      ),
      appBar: AppBar(
        title: Text(
          tr('ScolarShip'),
          style: TextStyle(
              fontFamily: 'Schyler', color: Colors.white, fontSize: w * .07),
        ),
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
      body: Obx(
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
                  padding: EdgeInsets.symmetric(horizontal: w * .02),
                  itemCount:controller.model.length,
                  itemBuilder: (context, i) {
                    return ScoalrShipCard(
                      maxNumber: controller.model[i].max_number,
                      acadimacYear: controller.model[i].academic_years,
                      description:controller.model[i].description,
                      collage: controller.model[i].collage
                    );
                  },
                );
        },
      ),
    );
  }
}
