// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../../config/server_config.dart';
// import '../../config/userinformation.dart';
// import '../../models/statistic_model.dart';

// class StatisticService {
//   late String message;
//   var urlBeneficiary = Uri.parse(
//       ServerConfig.domainNameServer + ServerConfig().getBeneficiaryCountApi);
//   var urlChallenges = Uri.parse(
//       ServerConfig.domainNameServer + ServerConfig().getChallengesCountApi);
//   // var urlWarrently = Uri.parse(
//   //     ServerConfig.domainNameServer + ServerConfig().getWarrentlyCountApi);
//   var urlStudyZones = Uri.parse(
//       ServerConfig.domainNameServer + ServerConfig.getStudyZonesCountApi);
//   var urlDonater = Uri.parse(
//       ServerConfig.domainNameServer + ServerConfig().getBeneficiaryCountApi);
//   Stream<List<StatisticModel>> getStatisticStream(String token) {
//     return Stream.periodic(const Duration(seconds: 3))
//         .asyncMap((event) => getStatistic(token));
//   }

//   Future<List<StatisticModel>> getStatistic(String token) async {
//     var responseBeneficiary = await http.get(
//       urlBeneficiary,
//       headers: {'Authorization': 'Bearer $token'},
//     );
//     var responseDonator = await http.get(
//       urlDonater,
//       headers: {'Authorization': 'Bearer $token'},
//     );
//     var responseChallenges = await http.get(
//       urlChallenges,
//       headers: {'Authorization': 'Bearer $token'},
//     );
    // var responseWarrently = await http.get(
    // urlWarrently,
    // headers: {'Authorization': 'Bearer $token'},
    // );
    // var responseStudyZones = await http.get(
    //   urlStudyZones,
      // headers: {'Authorization': 'Bearer $token'},
    // );
    // var rStudyZones = jsonDecode(responseStudyZones.body);
    // var rWarrently = jsonDecode(responseWarrently.body);
    // var rChallenges = jsonDecode(responseChallenges.body);
    // var rDonater = jsonDecode(responseDonator.body);
    // var rBeneficiary = jsonDecode(responseBeneficiary.body);
    // print(rBeneficiary);
    // if (responseStudyZones.statusCode == 200) {
      // dynamic article1 = rStudyZones['data'];
      // dynamic article2 = rWarr/ently['data'];
      // dynamic article3 = rChallenges['data'];
      // dynamic article4 = rDonater['data'];
      // dynamic article5 = rBeneficiary['data'];
      // List<StatisticModel> model = [];
      // model.add(StatisticModel(
          // tBeneficiary: article5,
          // tDonater: article4,
          // tChallenges: article3,
          // tWarrently: article2,
          // tStudyZones: article1,
          // statistic: Map()));
      // return model;
    // } else if (responseBeneficiary.statusCode == 401) {
      // Map<String, dynamic> m = {
        // "name": "null",
      // };
      //message = r['message'];
      // return [StatisticModel.fromMap(m)];
    // } else {
      //   message = r['message'];
      // return [];
    // }
  // }
// }
