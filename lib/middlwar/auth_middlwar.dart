import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class AuthMiddlwar extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (shared!.getString('role') == 'user') {
      return const RouteSettings(name: '/Login');
    } else /*if (shared!.getString('role') == null) */ {
      return const RouteSettings(name: '/');
    }
  }
}
