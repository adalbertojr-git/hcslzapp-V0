class Dependent {
  final int id;
  String name;
  String email;
  String phone;
  String cpf;
  String bloodType;
  String dateBirth;
  String isAssociated;

  Dependent({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.cpf,
    required this.bloodType,
    required this.dateBirth,
    required this.isAssociated,
  });

  Dependent.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        cpf = json['cpf'],
        bloodType = json['bloodType'],
        dateBirth = json['dateBirth'],
        isAssociated = json['isAssociated'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'cpf': cpf,
        'bloodType': bloodType,
        'dateBirth': dateBirth,
        'isAssociated': isAssociated,
      };

  @override
  String toString() {
    return 'Dependent{id: $id, name: $name, email: $email, phone: $phone, '
        'cpf: $cpf, bloodType: $bloodType, dateBirth: $dateBirth, '
        'isAssociated: $isAssociated}';
  }
}
