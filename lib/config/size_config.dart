import 'package:flutter/material.dart';

isPortrait(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait
      ? true
      : false;
}

isMobile(BuildContext context) {
  return MediaQuery.of(context).size.shortestSide < 600 ? true : false;
}
