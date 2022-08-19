// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CharityProfileModel {
  late String theImportantInfo;
  late String image;
  late String beneficiaryNum;
  late String donaterNum;
  late String challengesNum;
  CharityProfileModel({
    required this.theImportantInfo,
    required this.image,
    required this.beneficiaryNum,
    required this.donaterNum,
    required this.challengesNum,
  });

  Map<String, dynamic> toMap() {
    return {
      'theImportantInfo': theImportantInfo,
      'image': image,
      'beneficiaryNum': beneficiaryNum,
      'donaterNum': donaterNum,
      'challengesNum': challengesNum,
    };
  }

  factory CharityProfileModel.fromMap(Map<String, dynamic> map) {
    return CharityProfileModel(
      beneficiaryNum: map['beneficiaryNum: '] ?? '',
      challengesNum: map['challengesNum'] ?? '',
      donaterNum: map['donaterNum'] ?? '',
      image: map['image'] ?? '',
      theImportantInfo: map['theImportantInfo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CharityProfileModel.fromJson(String source) =>
      CharityProfileModel.fromMap(json.decode(source));
}
