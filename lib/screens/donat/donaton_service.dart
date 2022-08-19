import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../models/donationModel.dart';

class DonationService {
  late String message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.donationApi);
  donat(
    DonatModel model,
    /*String token*/
  ) async {
    var response = await http.post(
        url
        /*,headers: {
      'Authorization': 'Bearer ${token}'
    }, */
        ,
        body: {
          "d_amount": model.dAmount,
          "user_id": model.userId,
          "pank_num": model.pankNum,
        });
    print(response.body);
    print(response.statusCode);
    var r = jsonDecode(response.body);

    if (response.statusCode == 200) {
      message = r['message'];
      return true;
    } else if (response.statusCode == 401) {
      message = r['message'];
      return false;
    } else {
      message = r['message'];
      return false;
    }
  }
}
