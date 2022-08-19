import 'dart:convert';

class DonatModel {
  String dAmount;
  int userId;
  double pankNum;
  DonatModel({
    required this.dAmount,
    required this.pankNum,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'dAmount': dAmount,
      'userId': userId,
    };
  }

  factory DonatModel.fromMap(Map<String, dynamic> map) {
    return DonatModel(
      dAmount: map['dAmount'] ?? '',
      pankNum: map['pankNum: '] ?? '',
      userId: map['userId: '] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DonatModel.fromJson(String source) =>
      DonatModel.fromMap(json.decode(source));
}
