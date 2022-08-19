import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../models/challlengeModel.dart';

class ChallengeService {
  late String message;
  var url = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig.getChallengeDateApi);
  var urlTrinding =
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().getChallengeApi);

  Stream<List<ChallengeModel>> getChallengeStream(String token) {
    return Stream.periodic(const Duration(seconds: 1))
        .asyncMap((event) => getChallenge(token));
  }

  Stream<List<ChallengeModel>> getChallengeTrindingStream(String token) {
    return Stream.periodic(const Duration(seconds: 3))
        .asyncMap((event) => getTrinding(token));
  }

  Future<List<ChallengeModel>> getChallenge(String token) async {
    var response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      print(response.body);
      var r = await jsonDecode(response.body);
      Map<String, dynamic> s = r;
      List<dynamic> articles = s['data'];
      RxList<ChallengeModel> model = <ChallengeModel>[].obs;
      for (var i in articles) {
        model.add(ChallengeModel.fromMap(i));
      }
      // message = r['message'];
      return model;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> m = {
        'specialization': 'null',
        'year': 'null',
        'about': 'null',
        'amount': 'null'
      };
      message = 's'; //r['message'];
      return [ChallengeModel.fromMap(m)];
    } else {
      message = 's'; //r['message'];
      return [];
    }
  }

  Future<List<ChallengeModel>> getTrinding(String token) async {
    var response = await http.get(
      urlTrinding,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      print(response.body);
      var r = await jsonDecode(response.body);
      Map<String, dynamic> s = r;
      List<dynamic> articles = s['data'];
      RxList<ChallengeModel> model = <ChallengeModel>[].obs;
      if (articles.length < 4) {
        for (var i in articles) {
          model.add(ChallengeModel.fromMap(i));
        }
      } else {
        for (int i = 0; i < 3; i++) {
          model.add(ChallengeModel.fromMap(articles[i]));
        }
      }
      // message = r['message'];
      return model;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> m = {
        'specialization': 'null',
        'year': 'null',
        'about': 'null',
        'amount': 'null'
      };
      message = 's'; //r['message'];
      return [ChallengeModel.fromMap(m)];
    } else {
      message = 's'; //r['message'];
      return [];
    }
  }
}
