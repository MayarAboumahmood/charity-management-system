import 'package:get/get.dart';
import 'package:project_one/const.dart';

import '../../config/userinformation.dart';
import '../../store/store.dart';

class OnBoardContoller extends GetxController {
  List<Map<String, String>> pagedetals = [
    {"title": "welcome to our app", "image": "images/onboard1.jpg"},
    {
      "title": "the main aim is to help the students",
      "image": "images/onboard2.jpg"
    },
    {
      "title":
          "we help people we help people to put their money in the right place",
      "image": "images/onboard3.jpg"
    },
    {
      "title": "hopefully this app will be helpful",
      "image": "images/onboard4.jpg"
    }
  ];
  // ignore: prefer_typing_uninitialized_variables
  var pageindex;
  @override
  void onInit() async {
    pageindex = 1.obs;
    StoreInfo store = StoreInfo();
    UserInformation.app_theme = await store.read("theme") ?? "light";
    UserInformation.app_theme == "light"
        ? Get.changeTheme(Themes.customlighttheme)
        : Get.changeTheme(Themes.customdarktheme);

    super.onInit();
  }
  /* onpress()async{
   if(Config_user.user==null){
     Get.offAndToNamed("/signin");
   }else{
     if(Config_user.user!.emailVerified==false){
       Get.snackbar("verify email","please verify email to continue");
       Get.offAndToNamed('/verify');
     }else{
            Get.offAndToNamed('/home');

     }
   }
  }
  */
}
