import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../config/server_config.dart';
import '../../../../models/warrentlymodel.dart';

class AddWarrentlyService {
  var url =
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.addWarrentlyApi);

  String message = '';
  Future<bool> add(WarrentlyModel model, var token) async {
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer ${token}'
    }, body: {
      'specialization': model.specialization,
      'year': model.year,
      'about': model.about,
      'amount': model.amount,
    });
    print(response.body);
    print(response.statusCode);
    var r = jsonDecode(response.body);
    message = r['message'];
    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }
}
