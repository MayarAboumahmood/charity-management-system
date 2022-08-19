import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../const.dart';
import '../size_config.dart';
import 'button.dart';

// ignore: must_be_immutable
class WiNotifiacationCard extends StatelessWidget {
  late String username;
  late String about;
  late double amount;

  WiNotifiacationCard(
      {Key? key,
      required this.amount,
      required this.username,
      required this.about})
      : super(key: key);

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

    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * .03),
      child: SizedBox(
        width: w,
        height: h * .23,
        child: Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
          Container(
            width: w,
            height: h * .1,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(w * .01, h * .008),
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 8)
                ],
                color: num3Color,
                borderRadius: BorderRadius.all(Radius.circular(w * .03))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      '${tr('User Name')}: $username',
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      '${tr('The amount required')}: $amount',
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w * .02),
                    child: AutoSizeText(
                      '${tr('More info')}: $about',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      maxLines: 4,
                    ),
                  ),
                ]),
          ),
          Positioned(
            bottom: h * -0.03,
            right: w * .05,
            child: ContButton(
              myShadow: 0.008,
              myRadius: w * .1,
              myfontSize: w * .042,
              mycolor: primaryColor,
              myheight: 0.059,
              mywidth: 0.35,
              ontap: () {},
              title: "approval",
            ),
          ),
          Positioned(
            bottom: h * -0.03,
            left: w * .05,
            child: ContButton(
              myShadow: 0.008,
              myRadius: w * .1,
              myfontSize: w * .042,
              mycolor: primaryColor,
              myheight: 0.059,
              mywidth: 0.35,
              ontap: () {},
              title: "decline",
            ),
          ),
        ]),
      ),
    );
  }
}
