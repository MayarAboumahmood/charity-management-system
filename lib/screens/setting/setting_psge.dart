import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/size_config.dart';
import '../../const.dart';
import '../drawer/drawer.dart';
import 'setting_controller.dart';

// ignore: must_be_immutable
class SettingPage extends StatelessWidget {
  SettingController controller = Get.find();

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
        appBar: AppBar(
            title: Text(
              tr("Setting"),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: w * .07,
                  fontFamily: 'Schyler'),
            ),
            elevation: 0,
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
                    ))),
        body: Column(
          children: [
            Obx(() {
              return SizedBox(
                child: SwitchListTile(
                    title: Text(
                      "Dark Mode",
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : lowWhite),
                    ).tr(),
                    value: controller.dark.value,
                    onChanged: (bool) {
                      controller.changeTheme();
                    }),
              );
            }),
            Container(
                padding: const EdgeInsets.only(left: 15),
                margin: const EdgeInsets.all(5),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    //color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton(
                    items: controller.lang
                        .map((e) => DropdownMenuItem(child: Text(e), value: e))
                        .toList(),
                    onChanged: (val) async {
                      await controller.changeLang(context);
                    },
                    hint: const Text(
                      "Select Language",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ).tr())),
          ],
        ));
  }
}
