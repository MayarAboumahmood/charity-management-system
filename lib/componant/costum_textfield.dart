import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class CostumField extends StatelessWidget {
  String hint;
  String? label;
  Widget? iconsuffex;
  TextInputType? inputtype;
  Function(String?)? onsaved;
  Function()? onTap;
  String? Function(String?)? validat;
  TextEditingController? controller;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? sucer;
  CostumField(
      {Key? key,
      this.suffixIcon,
      this.sucer,
      this.prefixIcon,
      required this.hint,
      this.label,
      this.iconsuffex,
      this.inputtype,
      this.onsaved,
      this.onTap,
      this.controller,
      this.validat})
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
    return SizedBox(
      height: h * .1,
      child: TextFormField(
        obscureText: sucer ?? true,
        cursorColor: /*!Get.isDarkMode ?*/ Colors.black12 /*: Colors.white*/,
        validator: validat,
        controller: controller,
        onSaved: onsaved,
        onTap: onTap,
        keyboardType: inputtype,
        decoration: InputDecoration(
            hintText: tr(hint),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            label: label != null
                ? Text(
                    tr(label!),
                    style: TextStyle(
                        color: /*!Get.isDarkMode
                            ? Themes.customdarktheme.*/
                            primaryColor /*
                            : Themes.customlighttheme.primaryColor*/
                        ),
                  )
                : null,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: !Get.isDarkMode
                      ? Themes.customdarktheme.primaryColor
                      : Themes.customlighttheme.primaryColor),
              borderRadius: BorderRadius.circular(30.0),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.only(left: w * .07)),
      ),
    );
  }
}
