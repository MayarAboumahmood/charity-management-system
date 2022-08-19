import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_one/config/userinformation.dart';
import 'package:project_one/screens/rigester/rigester.dart';
import '../../../../config/server_config.dart';
import '../../../../models/study_zone_model.dart';

class AddStudyZoneService {
  var client = http.Client();
  String baseApi = ServerConfig.domainNameServer + ServerConfig.addStudyZoneApi;
  addStudyZones({
    required StudyZoneModel model,
    //   required name,
    // required state,
    // required city,
    // required description,
    // required phone,
    // required street
  }) async {
    var response = await client.post(Uri.parse(baseApi), headers: {
      'Authorization': 'Bearer ${UserInformation.user_token}'
    }, body: {
      "name": model.name,
      "location": model.location,
      "description": model.description,
      "phone": model.phone,
      "available_times": model.availableTimes,
      "charity_id": '1'
    });
    print(response.statusCode);
    //print(jsonDecode(response.body));
    var r = await json.decode((response.body));
    print(r);

    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 404) {
      return false;
    } else {
      return false;
    }
  }
}
