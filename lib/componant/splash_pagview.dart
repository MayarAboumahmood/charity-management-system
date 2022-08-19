import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

// ignore: must_be_immutable
class SplashItem extends StatelessWidget {
  String title;
  String image;
  SplashItem({Key? key, required this.title, required this.image})
      : super(key: key);
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
    return Column(
      children: [
        AutoSizeText(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 15),
        ),
        SizedBox(
          height: h * .02,
        ),
        Image.asset(
          image,
          height: h * .5,
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class SplashItemProfile extends StatelessWidget {
  String image;
  SplashItemProfile({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isportrai = isPortrait(context);
    double h /*, w*/;
    if (isportrai) {
      h = MediaQuery.of(context).size.height;
      // w = MediaQuery.of(context).size.width;
    } else {
      // w = MediaQuery.of(context).size.height;
      h = MediaQuery.of(context).size.width;
    }
    return Column(
      children: [
        const Spacer(flex: 2),
        Image.asset(
          image,
          height: h * .5,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
