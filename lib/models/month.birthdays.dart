class MonthBirthdays {
  final String name;
  final String date_birth;
  final String status;
  final String associated_type;

  MonthBirthdays({
    required this.name,
    required this.date_birth,
    required this.status,
    required this.associated_type,
  });

  MonthBirthdays.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        date_birth = json['date_birth'],
        status = json['status'],
        associated_type = json['associated_type'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'date_birth': date_birth,
        'status': status,
        'associated_type': associated_type,
      };

  @override
  String toString() {
    return 'MonthBirthdays{name: $name, date_birth: $date_birth, '
        'status: $status, associated_type: $associated_type}';
  }
}
