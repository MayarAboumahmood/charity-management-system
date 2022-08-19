import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/componant/training_opportunity_card.dart';
import '../../config/userinformation.dart';
import '../../const.dart';
import '../../size_config.dart';
import '../../screens/drawer/drawer.dart';
import 'training_opprtunity_controller.dart';

class TrainingOpportunityPage extends StatelessWidget {
  TrainingOpportunityPage({Key? key}) : super(key: key);
  TrainingOpprtunityController controller = Get.find();
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
        floatingActionButton: UserInformation.usertype == 'admin'
            ? FloatingActionButton(
                onPressed: () {
                  Get.toNamed('/Add_Trining');
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
              'Training opportunity',
              style: TextStyle(
                  fontFamily: 'Schyler',
                  color: Colors.white,
                  fontSize: w * .06),
            ).tr(),
            elevation: 0,
            backgroundColor: Get.isDarkMode
                ? Themes.customdarktheme.primaryColor
                : Themes.customlighttheme.primaryColor,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: w * .07,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
            leading: Builder(
                builder: (context) => IconButton(
                      iconSize: w *
                          .09, //-----------------------------------------------------
                      color: Colors.white,
                      icon: const Icon(Icons.menu_rounded),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ))),
        body: SafeArea(child: Obx(() {
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
                    horizontal: w * .05,
                    vertical: h * .01,
                  ),
                  itemCount: controller.model.length,
                  itemBuilder: (context, i) {
                    return TrainingOppCard(
                      ontap: () {
                        Get.offNamed('/editeTrainingOpportunity',
                            arguments: controller.model[i]);
                      },
                      out_date: controller.model[i].out_date,
                      about: controller.model[i].about,
                      jobTitle: controller.model[i].name,
                      location: controller.model[i].location,
                      // requiredExp: controller.model[i].requiredExp,
                      phone: controller.model[i].phone,
                    );
                  },
                );
        })));
  }
}
/**
 *  TrainingOppCard(
              ontap: () {
                Get.offNamed(
                  '/editeTrainingOpportunity',
                );
              },
              holidays: 'monday',
              jobTitle: 'flutter developer',
              location: 'syria_damascas_jaramana',
              requiredExp: '3 yers',
              phone: '09043583774',
            ),
              padding: EdgeInsets.symmetric(horizontal: w * .02),
        
 */