import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_one/config/userinformation.dart';
import 'package:project_one/models/warrentlymodel.dart';

import '../../../config/server_config.dart';
import '../../../models/applywarrentyModel.dart';

class ApplyWarrentyService {
  var client = http.Client();
  String baseApi =
      ServerConfig.domainNameServer + ServerConfig.applyWarrentyApi;

  String message = '';
  Future<bool> apply(WarrentlyModel model) async {
    var response = await client.post(Uri.parse(baseApi), headers: {
      'Authorization': 'Bearer ${UserInformation.user_token}'
    }, body: {
      'specialize': model.specialization,
      'academic_years': model.year,
      'description': model.about,
      'value': model.amount,
      "age": model.age,
      "gender": model.gender,
      "phone": model.phone,
      "location": model.location,
      "status": "0",
      // "pic": model.pic
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }
}
