import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/componant/training_opportunity_card.dart';
import 'package:project_one/config/userinformation.dart';
import '../../const.dart';
import '../../size_config.dart';
import '../../screens/drawer/drawer.dart';
import 'job_opportuity_controller.dart';

class JobOpportunityPage extends StatelessWidget {
  JobOpportunityPage({Key? key}) : super(key: key);

  JobController controller = Get.find();
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
                  Get.toNamed('/Add_Work');
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
              'job opportunity',
              style: TextStyle(
                  fontFamily: "Schyler",
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
                      iconSize: w *
                          .09, //-----------------------------------------------------
                      color: Colors.white,
                      icon: const Icon(Icons.menu_rounded),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ))),
        body: SafeArea(
          child: Obx(
            () {
              return controller.isload.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: w * .02),
                      itemCount: controller.model.length,
                      itemBuilder: (context, i) {
                        return TrainingOppCard(
                          about: controller.model[i].about,
                          jobTitle: controller.model[i].name,
                          ontap: () {
                            Get.offNamed('/EditeWork',
                                arguments: controller.model[i]);
                          },
                          phone: controller.model[i].phone,
                          // holidays: 'moday' /*controller.model[i].holidays*/,
                          // out_date:controller.model[i].out_date,
                          location: controller.model[i].location,
                          out_date: controller.model[i].out_date,
                        );
                      },
                    );
            },
          ),
        ));
  }
}
