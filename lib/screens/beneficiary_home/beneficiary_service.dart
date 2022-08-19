import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../models/beneficiaryModel.dart';

class BeneficiaryService {
  var url = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig().getBeneficiaryApi);
  Stream<List<BeneficiaryModel>> getStudyZoneStream(String token) {
    return Stream.periodic(const Duration(seconds: 1))
        .asyncMap((event) => getBeneficiary(token));
  }

  Future<List<BeneficiaryModel>> getBeneficiary(String token) async {
    var response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      print(r);
      Map<String, dynamic> s = r;
      List<dynamic> articles = s['data'];
      RxList<BeneficiaryModel> model = <BeneficiaryModel>[].obs;
      for (var i in articles) {
        model.add(BeneficiaryModel.map(i));
      }
      // message = r['message'];
      return model;
    } else if (response.statusCode == 401) {
      Map<String, dynamic> m = {
        "name": "null",
        "location": "null",
        "reason_off_benefit": "null",
        "amount": "null",
        "phone": "null",
        "date": "null",
        "available_times": "null",
        "age": "null",
        "id": "null",
      };
      // message = 'r[message]';
      return [BeneficiaryModel.map(m)];
    } else {
      // message = 'r[message]';
      return [];
    }
  }
}
