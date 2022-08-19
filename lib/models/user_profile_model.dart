// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/*====================*/
class UserProfileModel {
  final String name; /*first name and last name */
  final String loginDate;
  final String totalDonation;
  final String numSponserdStudent;
  final String totalChallenge;
  final int? id;
  UserProfileModel({
    required this.name,
    required this.loginDate,
    required this.totalDonation,
    required this.numSponserdStudent,
    required this.totalChallenge,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'loginDate': loginDate,
      'totalDonation': totalDonation,
      'numSponserdStudent': numSponserdStudent,
      'totalWarrantiesmoney': totalChallenge,
      'id': id,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      name: map['name'] as String,
      loginDate: map['loginDate'] as String,
      totalDonation: map['totalDonation'] as String,
      numSponserdStudent: map['numSponserdStudent'] as String,
      totalChallenge: map['totalWarrantiesmoney'] as String,
      id: map['id'] != null ? map['id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) =>
      UserProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
