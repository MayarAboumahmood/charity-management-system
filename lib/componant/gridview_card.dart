// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/size_config.dart';
import 'dec_image_alert.dart';

class GridViewCard extends StatelessWidget {
  final String imagename;
  const GridViewCard({
    Key? key,
    required this.imagename,
  }) : super(key: key);

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
      onTap: () {
        showDialog(
            // barrierColor: Colors.black,
            context: context,
            builder: (_) => DecImageAlert(
                  imagename: imagename,
                ),
            barrierDismissible: true);
      },
      child: SizedBox(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(w * .01),
            child: Image.asset(imagename, fit: BoxFit.fill)),
      ),
    );
  }
}
