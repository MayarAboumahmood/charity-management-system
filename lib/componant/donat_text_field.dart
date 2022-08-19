import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class DonatTextField extends StatelessWidget {
  final String hintText;
  final Color enableColor;
  final Color disableColor;
  final bool scurtext;
  final Function(String)? onsave;
  final TextInputType textType;
  Widget? suffixIcon;
  double symmetricPaddingRight;
  double symmetricPaddingLeft;
  // final Function(String) myonChange;

  DonatTextField({
    Key? key,
    // required this.myonChange,
    required this.textType,
    this.onsave,
    required this.symmetricPaddingRight,
    required this.symmetricPaddingLeft,
    this.suffixIcon,
    required this.scurtext,
    required this.disableColor,
    required this.enableColor,
    required this.hintText,
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
        left: w * symmetricPaddingLeft,
        right: w * symmetricPaddingRight,
      ),
      child: TextField(
        onSubmitted: onsave,
        keyboardType: textType,
        obscureText: scurtext,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          // labelStyle:
          //     const TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
          // labelText: labletext,
          hintText: tr(hintText),
          hintStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
          contentPadding:
              EdgeInsets.symmetric(horizontal: w * .04, vertical: h * .02),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(w * .04),
              topRight: Radius.circular(w * .04),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: enableColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: disableColor,
            ),
          ),
        ),
      ),
    );
  }
}
