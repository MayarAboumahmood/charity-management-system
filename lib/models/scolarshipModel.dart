import 'dart:convert';

class ScolarshipModel {
  final String max_number;
  final String image;
  final String? id;
  final String description;
  final String academic_years;
  final String collage;
  ScolarshipModel({
    required this.image,
    this.id,
    required this.max_number,
    required this.description,
    required this.academic_years,
    required this.collage,
  });

  Map<String, dynamic> toMap() {
    return {
      'max_number': max_number,
      'image': image,
      'description': description,
      'academic_years': academic_years,
      'collage': collage,
      'id': id,
    };
  }

  factory ScolarshipModel.fromMap(Map<String, dynamic> map) {
    return ScolarshipModel(
      max_number: map['max_number']?.toInt() ?? 0,
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      academic_years: map['academic_years'] ?? '',
      collage: map['collage'] ?? '',
      id: map['notes'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ScolarshipModel.fromJson(String source) =>
      ScolarshipModel.fromMap(json.decode(source));
}
