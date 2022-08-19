import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_one/models/charity_profile_model.dart';
import '../../config/server_config.dart';

class CharityProfileServic {
  late String message;
  var url = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig.getcharityProfileApi);
  var urlBeneficiary = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig().getBeneficiaryCountApi);
  var urlChallenges = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig().getChallengesCountApi);
  var urlDonater = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig.getdonaterCountApi);
  Future<List<CharityProfileModel>> getCharityProfile(String token) async {
    var response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseBeneficiary = await http.get(
      urlBeneficiary,
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseDonator = await http.get(
      urlDonater,
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseChallenges = await http.get(
      urlChallenges,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await jsonDecode(response.body);
      Map<String, dynamic> s = r;
      List<dynamic> articles = s['data'];
      RxList<CharityProfileModel> model = <CharityProfileModel>[].obs;
      for (var i in articles) {
        model.add(CharityProfileModel(
            theImportantInfo: i['about'],
            beneficiaryNum: responseBeneficiary.body,
            challengesNum: responseChallenges.body,
            donaterNum: responseDonator.body,
            image: ""));
      }

      // message =    message = r['message'];
      return model;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> m = {
        "name": "null",
      };
      // message = r['message'];
      return [CharityProfileModel.fromMap(m)];
    } else {
      // message = r['message'];
      Map<String, dynamic> m = {
        "name": "null",
      };
      return [];
    }
  }
}
