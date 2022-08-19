import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../config/server_config.dart';
import '../../../models/study_zone_model.dart';

class EditStudyZoneService {
  String message = '';
  Future<bool> add(StudyZoneModel model, var token) async {
    var url = Uri.parse(ServerConfig.domainNameServer +
        ServerConfig.editStudyApi +
        model.id.toString());

    var response = await http.post(url, headers: {
      'Authorization': 'Bearer ${token}'
    }, body: {
      "name": model.name,
      "location": model.location,
      "phone": model.phone,
      "available_times": model.availableTimes,
      "description": model.description,
    });
    print(response.body);
    print(response.statusCode);
    //   var r = jsonDecode(response.body);
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
