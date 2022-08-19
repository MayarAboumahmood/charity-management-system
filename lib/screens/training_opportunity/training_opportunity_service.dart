import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_one/config/userinformation.dart';
import '../../config/server_config.dart';
import '../../models/triningModel.dart';

class TrainingOpportunityService {
  late String message;

  var url;

  Stream<List<TrainingModel>> gettrainigStream(String token) {
    return Stream.periodic(const Duration(seconds: 1))
        .asyncMap((event) => gettrainig(token));
  }

  Future<List<TrainingModel>> gettrainig(String token) async {
    if (UserInformation.usertype == "admin") {
      url = Uri.parse(
          ServerConfig.domainNameServer + ServerConfig.gettriningeApi);
    } else {
      url = Uri.parse(
          ServerConfig.domainNameServer + ServerConfig.gettriningeApiuser);
    }
    var response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      print(r);
      // var r = jsonDecode(response.body);
      Map<String, dynamic> s = r;
      List<dynamic> articles = s['data'];
      RxList<TrainingModel> model = <TrainingModel>[].obs;
      for (var i in articles) {
        model.add(TrainingModel.fromMap(i));
      }
      // message = r['message'];
      return model;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> m = {
        "name": "null",
        "location": "null",
        "phone": "null",
        "available_times": "null",
        "description": "null",
        "id": '0',
      };
      // message = 'r[message]';
      return [TrainingModel.fromMap(m)];
    } else {
      // message = 'r[message]';
      return [];
    }
  }
}
