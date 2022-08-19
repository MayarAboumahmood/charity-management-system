import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/size_config.dart';

import '../const.dart';

// ignore: must_be_immutable
class Mytextfield extends StatelessWidget {
  final String hintText;
  final String labletext;
  final Color enableColor;
  final Color disableColor;
  final bool scurtext;
  final TextInputType textType;
  final Function(String?)? onsave;
  final void Function()? onEditingComplete;
  void Function(String)? onFieldSubmitted;
  // final void Function()? ontap;
  Function()? ontap;
  var validate;
  String? initvalue;

  // final Function(String) myonChange;

  Mytextfield({
    Key? key,
    this.initvalue,
    // required this.myonChange,
    required this.textType,
    required this.validate,
    this.onsave,
    this.onFieldSubmitted,
    this.ontap,
    required this.scurtext,
    required this.disableColor,
    required this.enableColor,
    this.onEditingComplete,
    required this.hintText,
    required this.labletext,
    TextEditingController? controller,
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

    return Padding(
      padding: EdgeInsets.only(
        left: w * 0.05,
        right: w * 0.05,
      ),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        initialValue: initvalue,
        keyboardType: textType,
        obscureText: scurtext,
        onSaved: onsave,
        onChanged: onsave,
        onTap: ontap,
        // onEditingComplete: onEditingComplete,
        validator: validate,
        // onChanged: myonChange,
        decoration: InputDecoration(
          labelStyle:
              TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
          labelText: tr(labletext),
          hintText: tr(hintText),
          contentPadding:
              EdgeInsets.symmetric(horizontal: w * .04, vertical: h * .02),
          border: const OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                  color: Get.isDarkMode ? Colors.white54 : Colors.black)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                color: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}
