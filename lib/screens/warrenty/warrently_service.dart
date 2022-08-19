import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/server_config.dart';
import '../../config/userinformation.dart';
import '../../models/warrentlymodel.dart';

class WarrentlyService {
  late String message;

  dynamic url;
  Stream<List<WarrentlyModel>> getWarrentlyStream(String token) {
    return Stream.periodic(const Duration(seconds: 3))
        .asyncMap((event) => getWarrently(token));
  }

  Future<List<WarrentlyModel>> getWarrently(String token) async {
    if (UserInformation.usertype == 'admin') {
      url = Uri.parse(
          ServerConfig.domainNameServer + ServerConfig().getWarrentlyApi);
    } else {
      url = Uri.parse(
          ServerConfig.domainNameServer + ServerConfig().getWarrentlyApiuser);
    }

    print("start");
    var response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      var r = await json.decode(response.body);
      Map<String, dynamic> s = r;
      List<dynamic> articles = s['data'];
      RxList<WarrentlyModel> model = <WarrentlyModel>[].obs;
      for (var i in articles) {
        model.add(WarrentlyModel.map(i));
      }
      // message = r['message'];
      return model;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> m = {
        'specialization': 'null',
        'year': 'null',
        'about': 'null',
        'amount': 'null'
      };
      message = 's'; //r['message'];
      return [WarrentlyModel.map(m)];
    } else {
      message = 's'; //r['message'];
      return [];
    }
  }
}
