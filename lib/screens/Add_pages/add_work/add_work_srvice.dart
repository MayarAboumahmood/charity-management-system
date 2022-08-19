import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_one/models/workModel.dart';

import '../../../../config/server_config.dart';
import '../../../config/userinformation.dart';

class AddworkService {
  var client = http.Client();

  String baseApi = ServerConfig.domainNameServer + ServerConfig.addWorkApi;

  String message = '';
  Future<bool> addTrainings(JobModel model) async {
    var response = await client.post(Uri.parse(baseApi), headers: {
      'Authorization': 'Bearer ${UserInformation.user_token}'
    }, body: {
      "name": model.name,
      "holiday": 'holiday',
      "about": model.about,
      "phone": model.phone,
      "out_date": model.out_date,
      "charity_id": "1",
      "required_experience": '2', //model.required_experience,
      "location": 'somewhere' //model.location
    });
    print(response.body);
    print(response.statusCode);
    // var r = await json.decode((response.body));
    // message = r['message'];
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 404) {
      return false;
    } else {
      return false;
    }
  }
}
