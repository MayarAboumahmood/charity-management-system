// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/*====*/
class NotificationModel {
  final String title;
  final String about;
  final int? id;

  NotificationModel({
    required this.title,
    required this.about,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'about': about,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] as String,
      about: map['about'] as String,
      id: null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
