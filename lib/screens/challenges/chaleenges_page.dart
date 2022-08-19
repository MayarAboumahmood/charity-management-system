import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/screens/drawer/drawer.dart';
import 'package:snapping_page_scroll/snapping_page_scroll.dart';
import '../../componant/challenges.dart';
import '../../componant/trending_card.dart';
import '../../const.dart';
import '../../size_config.dart';
import 'challenge_controller.dart';

// ignore: must_be_immutable
class ChallengesPage extends StatelessWidget {
  ChallengesPage({Key? key}) : super(key: key);

  ChallengeController controller = Get.find();

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/addchalenge');
          },
          backgroundColor: Get.isDarkMode
              ? Themes.customdarktheme.primaryColor
              : Themes.customlighttheme.primaryColor,
          child: const Icon(Icons.add),
        ),
        drawer: const Drawer(child: DrawerPage()),
        appBar: AppBar(
          title: Text(
            'Challenges',
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
            child: ListView(
                // clipBehavior: ,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: w * .05),
                children: [
              SizedBox(
                height: h * .02,
              ),
              Text(
                'Trending',
                style: TextStyle(fontSize: w * .05, color: primaryColor),
              ),
              SizedBox(
                height: h * .3,
                width: w * .8,
                child: SnappingPageScroll(
                  children: [
                    TrendingCard(
                      ranking: 'images/gold.png',
                      inDate: '2/2/2022',
                      gool: 1200,
                      name: 'challeng one',
                      performance: 60,
                    ),
                    TrendingCard(
                        ranking: 'images/selvar.png',
                        inDate: '2/2/2022',
                        gool: 1200,
                        name: 'challeng one',
                        performance: 40),
                    TrendingCard(
                        ranking: 'images/selvar.png',
                        inDate: '2/2/2022',
                        gool: 1200,
                        name: 'challeng one',
                        performance: 80),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.1),
                child: Text(
                  'Challenges',
                  style: TextStyle(fontSize: w * .05, color: primaryColor),
                ),
              ),
              SizedBox(
                height: h * .01,
              ),
              ChallengesUnit(
                  outDate: '2/2/2022',
                  inDate: '2/2/2022',
                  title: 'challenge num one',
                  imageName: 'images/onboard4.jpg',
                  aim: 12,
                  about: 'about this jfnal oajneoi oijaeoauiah'),
              SizedBox(
                height: h * .03,
              ),
              ChallengesUnit(
                  outDate: '2/2/2022',
                  inDate: '2/2/2022',
                  title: 'challenge num one',
                  imageName: 'images/splash_2.png',
                  aim: 12,
                  about: 'about this jfnal oajneoi oijaeoauiah'),
              SizedBox(
                height: h * .03,
              ),
            ]))
        // body: SafeArea(
        //   child: ListView(
        //       shrinkWrap: true,
        //       physics: const BouncingScrollPhysics(),
        //       padding: EdgeInsets.symmetric(horizontal: w * .05),
        //       children: [
        //         SizedBox(
        //           height: h * .02,
        //         ),
        //         Text(
        //           'Trending',
        //           style: TextStyle(
        //               fontSize: w * .05,
        //               color: Get.isDarkMode
        //                   ? Colors.white
        //                   : Themes.customlighttheme.primaryColor),
        //         ).tr(),
        //         SizedBox(
        //             height: h * .3,
        //             width: w * .8,
        //             child: ListView.builder(
        //                 shrinkWrap: true,
        //                 scrollDirection: Axis.horizontal,
        //                 physics: const BouncingScrollPhysics(),
        //                 padding: EdgeInsets.symmetric(horizontal: w * .02),
        //                 itemCount: controller.modelTrinding.length,
        //                 itemBuilder: (context, i) {
        //                   return TrendingCard(
        //                     inDate: controller.modelTrinding[i].inDate,
        //                     gool: controller.modelTrinding[i].amount,
        //                     name: controller.modelTrinding[i].name,
        //                     performance: controller.modelTrinding[i].amountPaid,
        //                     ranking: i + 1,
        //                   );
        //                 })),
        //         Padding(
        //           padding: const EdgeInsets.all(0.1),
        //           child: Text(
        //             'Challenges',
        //             style: TextStyle(
        //                 fontSize: w * .05,
        //                 color: Get.isDarkMode
        //                     ? Colors.white
        //                     : Themes.customlighttheme.primaryColor),
        //           ).tr(),
        //         ),
        //         SizedBox(
        //           height: h * .5,
        //           width: w * .8,
        //           child: ListView.builder(
        //               shrinkWrap: true,
        //               // scrollDirection: Axis.horizontal,
        //               physics: const NeverScrollableScrollPhysics(),
        //               padding: EdgeInsets.symmetric(horizontal: w * .02),
        //               itemCount: controller.model.length,
        //               itemBuilder: (context, i) {
        //                 return ChallengesUnit(
        //                     about: controller.model[i].description,
        //                     aim: controller.model[i].amount,
        //                     imageName: controller.model[i].image,
        //                     title: controller.model[i].name,
        //                     inDate: controller.model[i].inDate,
        //                     outDate: controller.model[i].outDate);
        //               }),
        //         )
        //       ]),
        // ),
        );
  }
}
