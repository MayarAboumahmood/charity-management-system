import 'package:http/http.dart' as http;
import 'package:project_one/config/userinformation.dart';
import '../../../config/server_config.dart';
import '../../../models/scolarshipModel.dart';

class AddScolarshipService {
  var client = http.Client();
  String baseApi =
      ServerConfig.domainNameServer + ServerConfig.addScolarshipApi;
  String message = '';
  Future<bool> add(ScolarshipModel model) async {
    var response = await client.post(Uri.parse(baseApi), headers: {
      'Authorization': 'Bearer ${UserInformation.user_token}'
    }, body: {
      "max_number": model.max_number,
      "description": model.description,
      "academic_years": model.academic_years,
      "collage": model.collage,
      "image": model.image,
      // "notes": model.notes,
      "charity_id": "1"
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 201) {
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
