import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class ContButton extends StatelessWidget {
  String title;
  Function()? ontap;
  Color? mycolor;
  double mywidth;
  double myheight;
  double myRadius;
  double myfontSize;
  double myShadow;

  ContButton({
    Key? key,
    /*required this.bordercolor,*/
    this.mycolor,
    required this.title,
    required this.ontap,
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
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: h * myheight,
        width: w * mywidth,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(MediaQuery.of(context).size.width * .01,
                  MediaQuery.of(context).size.height * myShadow),
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 8)
        ], color: mycolor, borderRadius: BorderRadius.circular(myRadius)),
        child: AutoSizeText(
          tr(title),
          style: TextStyle(fontSize: myfontSize, color: Colors.white),
        ),
      ),
    );
  }
}
