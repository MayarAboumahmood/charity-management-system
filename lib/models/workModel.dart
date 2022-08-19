// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JobModel {
  String name;
  // String holidays;
  String about;
  String requiredExp;
  String out_date;
  String location;
  String phone;
  JobModel({
    // required this.holidays,
    required this.name,
    required this.requiredExp,
    required this.about,
    required this.out_date,
    required this.location,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      // 'holidays': holidays,
      'about': about,
      'out_date': out_date,
      'location': location,
      'phone': phone,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      name: map['name'] ?? '',
      requiredExp: map['requiredExp'] ?? '',
      // holidays: map['holidays'] ?? '',
      about: map['about'] ?? '',
      out_date: map['out_date'] ?? '',
      location: map['location'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) =>
      JobModel.fromMap(json.decode(source));
}
