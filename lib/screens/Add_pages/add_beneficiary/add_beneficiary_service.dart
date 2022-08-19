import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../config/server_config.dart';
import '../../../../models/beneficiaryModel.dart';
import '../../../config/userinformation.dart';

class AddBenefiiaryService {
  var client = http.Client();
  String baseApi =
      ServerConfig.domainNameServer + ServerConfig.addBeneficiaryApi;
  addBeneficiary({
    required BeneficiaryModel model,
  }) async {
    var response = await client.post(Uri.parse(baseApi), headers: {
      'Authorization': 'Bearer ${UserInformation.user_token}'
    }, body: {
      "name": model.name,
      "date": model.date,
      "amount": model.amount,
      "age": model.age,
      "reason_off_benefit": model.reasonForAccepted,
      "location": model.location,
      "phone": model.phone,
      "charity_id": '1'
      // "notes": model.notes,
    });
    print(response.statusCode);
    print(response.body);
    // var r = await json.decode((response.body));
    // print(r);

    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 404) {
      return false;
    } else {
      return false;
    }
  }
}
