import 'package:image_picker/image_picker.dart';

class BeneficiaryModel {
  final String name;
  final String date;
  final String age;
  final String reasonForAccepted;
  final String location;
  final String phone;
  // final String notes; /*=======deleat=======*/
  final String? id;
  final String amount;
  // final XFile image;

  factory BeneficiaryModel.map(Map<String, dynamic> m, {string}) {
    return BeneficiaryModel(
      name: m['name'] ?? 'null',
      date: m['date'] ?? 'null',
      // image: m['image'] ?? 'null',
      id: m['id'].toString(),
      location: m['location'] ?? 'null',
      phone: m['phone'] ?? 'null',
      age: m['age'].toString(),
      reasonForAccepted: m['reason_off_benefit'] ?? 'null',
      // notes: m['notes'] ?? 'null',
      amount: m['amount'].toString(),
    );
  }

  BeneficiaryModel({
    required this.name,
    required this.amount,
    required this.age,
    required this.date,
    required this.reasonForAccepted,
    required this.location,
    required this.phone,
    // required this.image,
    this.id,
  });
}
