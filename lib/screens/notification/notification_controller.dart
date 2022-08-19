import 'package:get/get.dart';
import '../../models/Notification_model.dart';
import 'notification_service.dart';

class NotificationController extends GetxController {
  late RxBool isload;
  late NotificationService service;
  late RxList<NotificationModel> model;
  late String message;
  @override
  void onInit() {
    isload = false.obs;
    service = NotificationService();
    model = <NotificationModel>[].obs;
    message = '';
  }

  getdata() async {
    service.getNotificationStream().listen(
      (event) {
        model.value = event;
        isload.value = false;
        if (model[0].title == "null") {
          message = service.message;
          Get.offAllNamed('/Login');
        }
      },
    );
  }
}
