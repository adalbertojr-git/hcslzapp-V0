class MonthBirthdays {
  final String name;

  // ignore: non_constant_identifier_names
  final String date_birth;
  final String status;

  // ignore: non_constant_identifier_names
  final String associated_type;
  final String photoUrl;

  MonthBirthdays({
    required this.name,
    // ignore: non_constant_identifier_names
    required this.date_birth,
    required this.status,
    // ignore: non_constant_identifier_names
    required this.associated_type,
    required this.photoUrl,
  });

  MonthBirthdays.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        date_birth = json['date_birth'],
        status = json['status'],
        associated_type = json['associated_type'],
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'date_birth': date_birth,
        'status': status,
        'associated_type': associated_type,
        'photoUrl': photoUrl,
      };
}
