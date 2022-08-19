// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TrainingModel {
  String name;
  String about;
  String out_date;
  String phone;
  String location;
  String? id;

  String required_experience;
  TrainingModel(
      {required this.name,
      required this.required_experience,
      this.id,
      required this.about,
      required this.out_date,
      required this.phone,
      required this.location});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'about': about,
      'out_date': out_date,
      'phone': phone,
      'location': location,
    };
  }

  factory TrainingModel.fromMap(Map<String, dynamic> map) {
    return TrainingModel(
      name: map['name'] ?? '',
      id: map['id'].toString(),
      required_experience: map['requiredExp'] ?? '',
      about: map['about'] ?? '',
      out_date: map['out_date'] ?? '',
      phone: map['phone'].toString(),
      location: map['location'] ?? '',
      // city: map['city'] ?? '',
      // street: map['street'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainingModel.fromJson(String source) =>
      TrainingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
