import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../config/server_config.dart';
import '../../../../models/challlengeModel.dart';

class AddChallengeService {
  var url =
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.addChallengeApi);

  String message = '';
  Future<bool> add(ChallengeModel model, var token) async {
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token'
    }, body: {
      'name': model.name,
      'description': model.description,
      'image': model.image,
      'inDate': model.inDate,
      'outDate': model.outDate,
      'amount': model.amount.toString(),
      'amountPaid': model.amountPaid.toString(),
    });
    print(response.body);
    print(response.statusCode);
    // var r = jsonDecode(response.body);
    // message = r['message'];
    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }
}
