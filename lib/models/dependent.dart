class Dependent {
  final int id;
  String name;
  String email;
  String phone;
  String cpf;
  String bloodType;
  String dateBirth;
  String isAssociated;

  Dependent(this.id, this.name, this.email, this.phone, this.cpf,
      this.bloodType, this.dateBirth, this.isAssociated);

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
