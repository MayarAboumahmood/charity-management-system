import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/screens/drawer/drawer.dart';
import '../../componant/beneficiary_card.dart';
import '../../const.dart';
import '../../size_config.dart';
import 'beneficiary_controller.dart';

class Beneficiary extends StatelessWidget {
  Beneficiary({Key? key}) : super(key: key);
  BeneficiaryController controller = Get.find();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/Add_beneficiary');
        },
        backgroundColor: Get.isDarkMode
            ? Themes.customdarktheme.primaryColor
            : Themes.customlighttheme.primaryColor,
        child: const Icon(Icons.add),
      ),
      drawer: const Drawer(child: DrawerPage()),
      appBar: AppBar(
        title: AutoSizeText(
          tr('Beneficiary'),
          style: TextStyle(
              fontFamily: 'Schyler', color: Colors.white, fontSize: w * .07),
        ),
        elevation: 0,
        backgroundColor: Get.isDarkMode
            ? Themes.customdarktheme.primaryColor
            : Themes.customlighttheme.primaryColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: 30,
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
                      horizontal: w * .05,
                      vertical: h * .01,
                    ),
                    itemCount: controller.model.length,
                    itemBuilder: (context, i) {
                      return BeneficiaryCard(
                        date: controller.model[i].date,
                        imageName: const ['images/colleg1.jfif'],
                        location: controller.model[i].location,
                        name: controller.model[i].name,
                        reasonForAccepted:
                            controller.model[i].reasonForAccepted,
                        phone: controller.model[i].phone,
                        age: controller.model[i].age,
                        amount: controller.model[i].amount,
                        id: controller.model[i].id ?? '0',
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
