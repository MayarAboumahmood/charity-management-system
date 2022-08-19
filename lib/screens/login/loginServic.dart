import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../config/userinformation.dart';
import '../../models/loginModel.dart';
import '../../store/store.dart';

class LoginService {
  var message;
  var token;
  var url;
  Future<bool> login(LoginModel model) async {
    if (model.email == "shaz@a.com" ||
        model.email == "abee@r.com" ||
        model.email == "aya@google.com") {
      url = Uri.parse(ServerConfig.domainNameServer + ServerConfig().loginApi);
    } else {
      url = Uri.parse(
          ServerConfig.domainNameServer + ServerConfig().loginApiuser);
    }
    var response = await http.post(url, body: {
      "email": model.email,
      "password": model.password,
    });

    print(response.statusCode);
    print(response.body);
    print(model.email);
    print(ServerConfig().loginApi);

    if (response.statusCode == 200) {
      var r = jsonDecode(response.body);
      token = r['token'];
      UserInformation.user_token = token;
      print(UserInformation.user_token);
      StoreInfo info = StoreInfo();
      UserInformation.usertype = r['user_type'];
      await info.save("token", UserInformation.user_token);
      await info.save("usertype", UserInformation.usertype);
      return true;
    } else if (response.statusCode == 404) {
      message = "somthings wrong!";
      return false;
    } else {
      return false;
    }
  }
}
