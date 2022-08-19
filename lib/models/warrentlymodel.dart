class WarrentlyModel {
  String specialization;
  int? id;
  int? sponsor_id;
  int user_id;
  String year;
  String about;
  String amount;
  String location;
  String gender;
  String phone;
  String age; /*=====this is new====*/
  int? status;
  // List<String> pic;

  WarrentlyModel({
    this.id,
    this.sponsor_id,
    required this.user_id,
    required this.specialization,
    // required this.pic,
    required this.age,
    required this.gender,
    required this.year,
    required this.about,
    required this.amount,
    required this.location,
    required this.phone,
    this.status,
  });
  factory WarrentlyModel.map(Map<String, dynamic> m) {
    return WarrentlyModel(
      specialization: m['specialization'] ?? 'null',
      year: m['year'] ?? 'null',
      about: m['about'] ?? 'null',
      amount: m['amount'] ?? 'null',
      status: m['status'] ?? 0,
      location: m['location'] ?? 'null',
      phone: m['phone'] ?? 'null',
      // pic: m['pic'] ?? 'null',
      age: m['age'].toString(),
      id: m['id'] ?? 0,
      gender: m['gender'] ?? 0,
      user_id: m['user_id'] ?? 0,
    );
  }
}
