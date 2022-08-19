import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../componant/chart.dart';
import '../../componant/statistc_item.dart';
import '../../const.dart';
import '../../size_config.dart';
import '../drawer/drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'statistic_controller.dart';

class StatisticsPage extends StatelessWidget {
  StatisticsPage({Key? key}) : super(key: key);
  StatisticController controller = Get.find();
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
      backgroundColor: Theme.of(context).primaryColor,
      drawer: const Drawer(child: DrawerPage()),
      appBar: AppBar(
        title: AutoSizeText(
          tr('Statistics'),
          style: TextStyle(
              fontFamily: "Schyler", color: Colors.white, fontSize: w * .07),
        ),
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
        child: ListView(
          children: [
            SizedBox(
                height: h * .3,
                width: w,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Statistc_item(
                              type: "Beneficiary",
                              amount: "5",
                              color: Colors.red),
                        ),
                        Expanded(
                          child: Statistc_item(
                              type: "Donater",
                              amount: "0",
                              color: Colors.purpleAccent),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Statistc_item(
                            type: "Challenges",
                            amount: "3",
                            color: Colors.orange,
                          ),
                        ),
                        Expanded(
                          child: Statistc_item(
                              type: "warrenty",
                              amount: "0 ",
                              color: Colors.indigoAccent),
                        ),
                        Expanded(
                          child: Statistc_item(
                            type: "Study Zone",
                            amount: "5 ",
                            color: Colors.greenAccent,
                          ),
                        )
                      ],
                    )
                  ],
                )),
            const SChart(covidCases: [1, 3, 5, 9, 2, 3, 7]),
            Container(
              height: h * .05,
              color: Colors.white,
            )
          ],
        ),
      ),
      /*body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
                height: h * .3,
                width: w,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Statistc_item(
                              type: "Beneficiary",
                              amount: controller.model[0].tBeneficiary,
                              color: Colors.red),
                        ),
                        Expanded(
                          child: Statistc_item(
                              type: "Donater",
                              amount: controller.model[0].tDonater,
                              color: Colors.purpleAccent),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Statistc_item(
                            type: "Challenges",
                            amount: controller.model[0].tChallenges,
                            color: Colors.orange,
                          ),
                        ),
                        // Expanded(
                        // child: Statistc_item(
                        // type: "warrenty",
                        // amount:  controller.model[0].tWarrently,
                        // color: Colors.indigoAccent),
                        // ),
                        Expanded(
                          child: Statistc_item(
                            type: "Study Zone",
                            amount: controller.model[0].tStudyZones,
                            color: Colors.greenAccent,
                          ),
                        )
                      ],
                    )
                  ],
                )),
            const SChart(covidCases: [1, 3, 5, 9, 2, 3, 7]),
            Container(
              height: h * .05,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            )
          ],
        ),
      ),*/
    );
  }
}
