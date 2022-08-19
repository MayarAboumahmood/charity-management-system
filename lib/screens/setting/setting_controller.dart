import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../config/userinformation.dart';
import '../../const.dart';
import '../../store/store.dart';

class SettingController extends GetxController {
  List<String> lang = ["English", "Arabic"];
  late RxString l;
  late RxBool dark;
  late StoreInfo store;
  @override
  void onInit() async {
    //  dark = false.obs;
    store = StoreInfo();
    UserInformation.app_theme == "light" ? dark = false.obs : dark = true.obs;
    l = UserInformation.app_lang.obs;
    //  dark.value=await store.read("theme")=="dark"?true:false;
    super.onInit();
  }

  changeLang(BuildContext context) async {
    if (l.value == "ar") {
      //await store.save("lang", "en");
      l("en");

      const _newLocale = Locale('en');
      await context.setLocale(_newLocale);
      Get.updateLocale(_newLocale);
    } else {
      //  await store.save("lang", "ar");
      l("ar");
      const _newLocale = Locale("ar");
      print("to arabic");
      await context.setLocale(_newLocale);
      Get.updateLocale(_newLocale);
    }
  }

  changeTheme() async {
    print(Get.isDarkMode);
    if (dark.value) {
      await store.save("theme", "light");
      dark(false);
      Get.changeTheme(Themes.customlighttheme);
    } else if (!dark.value) {
      await store.save("theme", "dark");
      dark(true);
      Get.changeTheme(Themes.customdarktheme);
    }
    // dark.value = !dark.value;
  }
}
