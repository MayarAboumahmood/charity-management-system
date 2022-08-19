import 'package:get/get.dart';

import '../../config/userinformation.dart';
import 'drawer_service.dart';

class LogoutController extends GetxController {
  late LogoutService service;
  late String message;
  late bool logoutstate;
  @override
  void onInit() async {
    message = '';
    service = LogoutService();
    logoutstate = false;
    super.onInit();
  }

  doLogout() async {
    logoutstate = await service.logout(UserInformation.user_token);

    //  message = service.message;
  }
}
