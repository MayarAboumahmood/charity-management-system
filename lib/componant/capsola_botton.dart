import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

// ignore: must_be_immutable
class CapsolaButton extends StatelessWidget {
  String title1;
  String title2;
  Function() ontap1;
  Function() ontap2;
  Color mycolor;
  double mywidth;
  double myheight;
  double myRadius;
  double myfontSize;
  double myShadow;

  CapsolaButton({
    Key? key,
    /*required this.bordercolor,*/ required this.mycolor,
    required this.title1,
    required this.title2,
    required this.ontap1,
    required this.ontap2,
    required this.myheight,
    required this.mywidth,
    this.myRadius = 20,
    this.myfontSize = 20,
    this.myShadow = 0,
  }) : super(key: key);

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
    return Row(
      children: [
        GestureDetector(
          onTap: ontap1,
          child: Container(
            alignment: Alignment.center,
            height: h * myheight - h * .005,
            width: w * mywidth,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(MediaQuery.of(context).size.width * .01,
                          MediaQuery.of(context).size.height * myShadow),
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 8)
                ],
                color: mycolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(myRadius),
                  bottomLeft: Radius.circular(myRadius),
                )),
            child: AutoSizeText(
              tr(title1),
              style: TextStyle(fontSize: myfontSize, color: Colors.white),
            ),
          ),
        ),
        GestureDetector(
          onTap: ontap2,
          child: Container(
            alignment: Alignment.center,
            height: h * myheight,
            width: w * mywidth,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(MediaQuery.of(context).size.width * .01,
                          MediaQuery.of(context).size.height * myShadow),
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 8)
                ],
                color: mycolor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(myRadius),
                  bottomRight: Radius.circular(myRadius),
                )),
            child: AutoSizeText(
              tr(title2),
              style: TextStyle(fontSize: myfontSize, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
