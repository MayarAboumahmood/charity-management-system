import 'dart:convert';

class ApplyWarrentyModel {
  String name;
  String age;
  String gender;
  String academicYear;
  String location;
  String phone;
  String description;
  String specialize;
  List<dynamic> documents;
  ApplyWarrentyModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.academicYear,
    required this.location,
    required this.phone,
    required this.description,
    required this.specialize,
    required this.documents,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'academicYear': academicYear,
      'location': location,
      'phone': phone,
      'description': description,
      'specialize': specialize,
      'documents': documents,
    };
  }

  factory ApplyWarrentyModel.fromMap(Map<String, dynamic> map) {
    return ApplyWarrentyModel(
      name: map['name'] ?? '',
      age: map['age'] ?? '',
      gender: map['gender'] ?? '',
      academicYear: map['academicYear'] ?? '',
      location: map['location'] ?? '',
      phone: map['phone'] ?? '',
      description: map['description'] ?? '',
      specialize: map['specialize'] ?? '',
      documents: List<dynamic>.from(map['documents']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplyWarrentyModel.fromJson(String source) =>
      ApplyWarrentyModel.fromMap(json.decode(source));
}
