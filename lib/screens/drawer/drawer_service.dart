import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/server_config.dart';
import '../../config/userinformation.dart';
import '../../store/store.dart';

class LogoutService {
  var message;
  var url;
  Future<bool> logout(String token) async {
    if (UserInformation.usertype == 'admin') {
      url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.logoutApi);
    } else {
      url =
          Uri.parse(ServerConfig.domainNameServer + ServerConfig.logoutApiuser);
    }
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    print(response.statusCode);
    var r = await json.decode(json.encode(response.body));
    if (response.statusCode == 200) {
      UserInformation.user_token = '';
      StoreInfo info = StoreInfo();
      await info.remove("token");
      // message = r["message"];
      return true;
    } else if (response.statusCode == 401) {
      // message = r["message"];
      return false;
    } else {
      // message = r["message"];
      return false;
    }
  }
}
