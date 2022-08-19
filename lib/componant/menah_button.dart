import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class MenahButton extends StatelessWidget {
  String title;
  String image;
  Function() ontap;
  Color mycolor;

  MenahButton(
      {Key? key,
      required this.mycolor,
      required this.image,
      required this.title,
      required this.ontap})
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

    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: w * .6,
        height: h * .3,
        margin: EdgeInsets.symmetric(horizontal: w * .05, vertical: h * .02),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(w * .01, h * .008),
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 8)
          ],
          color: mycolor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: w * .01, vertical: h * .005),
              child: AutoSizeText(
                tr(title),
                style: TextStyle(fontSize: w * .06, color: Colors.white),
                maxLines: 1,
              ),
            ),
            const Spacer(),
            SizedBox(
              height: h * .25,
              // flex: 2,
              child: Container(
                  padding: EdgeInsets.only(
                      left: w * .01,
                      bottom: h * .01,
                      right: w * .01,
                      top: h * .01),
                  width: h * .5,
                  height: h * .2,
                  // color: Colors.red,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
