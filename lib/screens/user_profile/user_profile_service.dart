import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../models/user_profile_model.dart';

class UserProfileService {
  late String message;
  var url =
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.getUserProfileApi);
  var urlwarrently = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig().getBeneficiaryCountApi);
  var urlSponser = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig().getChallengesCountApi);
  var urlDonation = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig.getdonaterCountApi);
  var urlLogindate = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig.getdonaterCountApi);

  Future<UserProfileModel> getStudyZones(String token) async {
    var response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${token}'},
    );
    var responsewarrenty = await http.get(
      urlwarrently,
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseSponser = await http.get(
      urlSponser,
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseDonate = await http.get(
      urlDonation,
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseLogin = await http.get(
      urlLogindate,
      headers: {'Authorization': 'Bearer $token'},
    );

    print(response.body);
    print(response.statusCode);
    var r = jsonDecode(response.body);

    if (response.statusCode == 200) {
      var r = await jsonDecode(response.body);
      Map<String, dynamic> s = r;
      dynamic articles = s['data'];
      UserProfileModel model = UserProfileModel.fromMap(articles);
      message = r['message'];
      return model;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> m = {
        "name": "null",
        "location": "null",
        "phone": "null",
        "available_times": "null",
        "description": "null",
        "id": "null",
      };
      message = r['message'];
      return UserProfileModel.fromMap(m);
    } else {
      Map<String, dynamic> m = {
        "name": "",
        "location": "",
        "phone": "null",
        "available_times": "",
        "description": "",
        "id": "",
      };
      message = r['message'];
      return UserProfileModel.fromMap(m);
    }
  }
}
