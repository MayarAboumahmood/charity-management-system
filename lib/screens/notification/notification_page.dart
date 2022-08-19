import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../componant/notification_card.dart';
import '../../const.dart';
import '../../size_config.dart';
import '../drawer/drawer.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

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
        drawer: const Drawer(child: DrawerPage()),
        appBar: AppBar(
            title: Text(
              'Notification',
              style: TextStyle(
                  fontFamily: "Schyler",
                  color: Colors.white,
                  fontSize: w * .07),
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
                      iconSize: w * .08,
                      color: Colors.white,
                      icon: const Icon(Icons.menu_rounded),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ))),
        body: SafeArea(
            child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: w * .02),
                children: [
              ScNotifiacationCard(
                isscolar: true,
                universityname: 'damascos university',
                about: 'adfffffffffffffffffffffffffffffffffffffffffff',
                scname: 'the one and the only',
                username: 'mayar2',
              ),
              ScNotifiacationCard(
                isscolar: false,
                amount: '20',
                about: 'adfffffffffffffffffffffffffffffffffffffffffff',
                username: 'mayar2',
                specialization: 'info  tec',
              ),
              ScNotifiacationCard(
                isscolar: true,
                universityname: 'damascos university',
                about: 'adfffffffffffffffffffffffffffffffffffffffffff',
                scname: 'the one and the only',
                username: 'mayar2',
              ),
            ])));
  }
}
