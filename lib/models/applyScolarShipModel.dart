import 'dart:convert';

class ApplyScolarShipModel {
   String name;
   String age;
   String gender;
   String academicYear;
   String location;
   String phone;
   String notes;
   List<dynamic> documents;
  ApplyScolarShipModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.academicYear,
    required this.location,
    required this.phone,
    required this.notes,
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
      'notes': notes,
      'documents': documents,
    };
  }

  factory ApplyScolarShipModel.fromMap(Map<String, dynamic> map) {
    return ApplyScolarShipModel(
      name: map['name'] ?? '',
      age: map['age'] ?? '',
      gender: map['gender'] ?? '',
      academicYear: map['academicYear'] ?? '',
      location: map['location'] ?? '',
      phone: map['phone'] ?? '',
      notes: map['notes'] ?? '',
      documents: List<dynamic>.from(map['documents']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplyScolarShipModel.fromJson(String source) => ApplyScolarShipModel.fromMap(json.decode(source));
}
