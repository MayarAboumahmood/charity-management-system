import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../config/server_config.dart';
import '../../../models/triningModel.dart';

class EditTrainingService {
  String message = '';
  Future<bool> add(TrainingModel model, var token) async {
    var url = Uri.parse(ServerConfig.domainNameServer +
        ServerConfig.editTraining +
        model.id.toString());

    var response = await http.post(url, headers: {
      'Authorization': 'Bearer ${token}'
    }, body: {
      "name": model.name,
      "about": model.about,
      "phone": model.phone,
      "out_date": model.out_date,
    });
    print(response.body);
    print(response.statusCode);
    //  var r = jsonDecode(response.body);
    //message = r['message'];
    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }
}
