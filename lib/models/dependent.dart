class Dependent {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String cpf;
  final String bloodType;
  final String dateBirth;
  final String isAssociated;

  Dependent(this.id, this.name, this.email, this.phone, this.cpf,
      this.bloodType, this.dateBirth, this.isAssociated);

  Dependent.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        cpf = json['cpf'],
        bloodType = json['bloodType'],
        dateBirth = json['dateBirthToString'],
        isAssociated = json['isAssociated'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'cpf': cpf,
        'bloodType': bloodType,
        'dateBirthToString': dateBirth,
        'isAssociated': isAssociated,
      };

  @override
  String toString() {
    return 'Dependente{codigo: $id, nome: $name, email: $email, telefone: $phone, '
        'cpf: $cpf, tipoSanguineo: $bloodType, dataNascimento: $dateBirth, '
        'membroHc: $isAssociated}';
  }
}
