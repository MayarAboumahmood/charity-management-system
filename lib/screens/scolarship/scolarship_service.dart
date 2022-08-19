import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_one/config/userinformation.dart';
import '../../config/server_config.dart';
import '../../models/scolarshipModel.dart';

class ScolarShipService {
  late String message;

  var url;
  Stream<List<ScolarshipModel>> getScolarshipStream(String token) {
    return Stream.periodic(const Duration(seconds: 1))
        .asyncMap((event) => getScolarship(token));
  }

  Future<List<ScolarshipModel>> getScolarship(String token) async {
    if (UserInformation.usertype == "admin") {
      url = Uri.parse(
          ServerConfig.domainNameServer + ServerConfig().getScolarShipApi);
    } else {
      url = Uri.parse(
          ServerConfig.domainNameServer + ServerConfig().getScolarShipApiuser);
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
      RxList<ScolarshipModel> model = <ScolarshipModel>[].obs;
      for (var i in articles) {
        model.add(ScolarshipModel.fromMap(i));
      }
      // message = r['message'];
      return model;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> m = {
        'max_number': 0,
        'image': 'null',
        'description': 'null',
        'academic_years': 0,
        'college': 'null',
        'charity_id': 0,
      };
      // message = 'r[message]';
      return [ScolarshipModel.fromMap(m)];
    } else {
      // message = 'r[message]';
      return [];
    }
  }
}
