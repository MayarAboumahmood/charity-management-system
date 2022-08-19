import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../config/server_config.dart';
import '../../../models/applyScolarShipModel.dart';

class ApplyScolarShipService {
  var url = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig.applyScolarShipApi);

  String message = '';
  Future<bool> add(ApplyScolarShipModel model, var token) async {
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer ${token}'
    }, body: {
      'name': model.name,
      'age': model.age,
      'gender': model.gender,
      'academicYear': model.academicYear,
      'location': model.location,
      'phone': model.phone,
      'notes': model.notes
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
