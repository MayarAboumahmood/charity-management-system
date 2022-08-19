// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/*======== new new ============*/
class UserModel {
  final String firstName; /*first name and last name */
  final String lastName; /*first name and last name */
  final String loginDate;
  final int? id;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.loginDate,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first name': firstName,
      'last name': lastName,
      'loginDate': loginDate,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['first name'] as String,
      lastName: map['last name'] as String,
      loginDate: map['loginDate'] as String,
      id: map['id'] != null ? map['id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
