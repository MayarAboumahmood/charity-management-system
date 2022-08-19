import 'dart:convert';

class StatisticModel {
  String tBeneficiary;
  String tDonater;
  String tChallenges;
  String? tWarrently;
  String tStudyZones;
  Map<String, double> statistic;
//  double? amountPaid;
  StatisticModel({
    required this.tBeneficiary,
    required this.tDonater,
    required this.tChallenges,
    this.tWarrently,
    required this.tStudyZones,
    required this.statistic,
    //this.amountPaid,
  });
  Map<String, dynamic> toMap() {
    return {
      'Beneficiary': tBeneficiary,
      'Donater': tDonater,
      'Challenges': tChallenges,
      'Warrently': tWarrently,
      'StudyZones': tStudyZones,
      'statistic': statistic,
    };
  }

  factory StatisticModel.fromMap(Map<String, dynamic> map) {
    return StatisticModel(
      tBeneficiary: map['Beneficiary'] ?? '0',
      tDonater: map['Donater'] ?? '0',
      tChallenges: map['Challenges'] ?? '0',
      tWarrently: map['Warrently'] ?? '0',
      tStudyZones: map['StudyZones'] ?? '0',
      statistic: map['statistic']?.toDouble() ?? 0.0,
    );
  }
  String toJson() => json.encode(toMap());
  factory StatisticModel.fromJson(String source) =>
      StatisticModel.fromMap(json.decode(source));
}
