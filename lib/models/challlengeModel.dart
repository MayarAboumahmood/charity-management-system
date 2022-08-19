import 'dart:convert';

class ChallengeModel {
  String name;
  String? id;
  String description;
  String image;
  String inDate;
  String outDate;
  double amount;
  double amountPaid;
  ChallengeModel({
    required this.name,
    this.id,
    required this.description,
    required this.image,
    required this.inDate,
    required this.outDate,
    required this.amount,
    required this.amountPaid,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'inDate': inDate,
      'outDate': outDate,
      'amount': amount,
      'amountPaid': amountPaid,
    };
  }

  factory ChallengeModel.fromMap(Map<String, dynamic> map) {
    return ChallengeModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      inDate: map['inDate'] ?? '',
      outDate: map['outDate'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      amountPaid: map['amountPaid']?.toDouble() ?? 0.0,
      id: map['id'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChallengeModel.fromJson(String source) =>
      ChallengeModel.fromMap(json.decode(source));
}
