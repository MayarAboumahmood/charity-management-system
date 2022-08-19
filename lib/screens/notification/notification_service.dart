import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_one/models/Notification_model.dart';
import '../../config/server_config.dart';

// ignore: camel_case_types
class NotificationService {
  late String message;
  var url = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig.getNotificationApi);
  Stream<List<NotificationModel>> getNotificationStream() {
    return Stream.periodic(const Duration(days: 3))
        .asyncMap((event) => getNotification());
  }

  Future<List<NotificationModel>> getNotification(/*String token*/) async {
    var response = await http.get(
      url,
      // headers: {'Authorization': 'Bearer $token'},
    );
    print(response.body);
    print(response.statusCode);
    var r = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<dynamic> articles = r['data'];
      RxList<NotificationModel> model = <NotificationModel>[].obs;
      for (var i in articles) {
        model.add(NotificationModel.fromMap(i));
      }
      message = r['message'];
      return model;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> m = {
        "title": "null",
        "about": "null",
        "id": "null",
      };
      message = r['message'];
      return [NotificationModel.fromMap(m)];
    } else {
      message = r['message'];
      return [];
    }
  }
}
