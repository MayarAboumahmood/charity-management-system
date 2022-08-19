import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_one/models/workModel.dart';
import '../../config/server_config.dart';
import '../../config/userinformation.dart';

class JobOpportuityService {
  late String message;

  var url;
  Stream<List<JobModel>> getJobStream(String token) {
    return Stream.periodic(const Duration(seconds: 1))
        .asyncMap((event) => getgetJobs(token));
  }

  Future<List<JobModel>> getgetJobs(String token) async {
    if (UserInformation.usertype == "admin") {
      url = Uri.parse(ServerConfig.domainNameServer + ServerConfig().getJobApi);
    } else {
      url = Uri.parse(
          ServerConfig.domainNameServer + ServerConfig().getJobApiuser);
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
      RxList<JobModel> model = <JobModel>[].obs;
      for (var i in articles) {
        model.add(JobModel.fromMap(i));
      }
      // message = r['message'];
      return model;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> m = {
        "name": "null",
        "location": "null",
        'requiredExp': "null",
        "phone": "null",
        "available_times": "null",
        "description": "null",
        "id": "null",
      };
      // message = 'r[message]';
      return [JobModel.fromMap(m)];
    } else {
      // message = 'r[message]';
      return [];
    }
  }
}
