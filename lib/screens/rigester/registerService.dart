import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../config/userinformation.dart';
import '../../models/registerModel.dart';
import '../../store/store.dart';

class RegisterService {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.registerApi);
  var message;
  var token;
  Future<bool> register(RegisterModel loginmodel) async {
    var response = await http.post(url, body: {
      "email": loginmodel.email,
      "password": loginmodel.password,
      "first name": loginmodel.firstName,
      "last name": loginmodel.lastName,
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = jsonDecode(response.body);
      print("200 erorr");
      message = r['message'];
      token = r['access_token'];
      UserInformation.user_token = token;
      StoreInfo info = StoreInfo();
      await info.save("token", UserInformation.user_token);
      return true;
    } else if (response.statusCode == 401) {
      print("401 erorr");
      message = 'wrongs';
      return false;
    } else {
      message = "server erore";
      return false;
    }
  }
}
