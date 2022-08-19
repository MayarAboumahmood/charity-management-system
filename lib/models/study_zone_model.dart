class StudyZoneModel {
  late String name;
  late String location;
  late String phone;
  late String availableTimes;
  late String description;
  late String? id;
  factory StudyZoneModel.map(Map<String, dynamic> m, {string}) {
    return StudyZoneModel(
      name: m['name'] ?? 'null',
      id: m['id'].toString(),
      location: m['location'] ?? 'null',
      phone: m['phone'] ?? 'null',
      availableTimes: m['available_times'] ?? 'null',
      description: m['description'] ?? 'null',
    );
  }

  StudyZoneModel(
      {required this.name,
      required this.location,
      required this.phone,
      required this.availableTimes,
      required this.description,
      this.id});
}
