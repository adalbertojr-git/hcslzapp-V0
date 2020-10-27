/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe do objeto Dependente

*/
class Dependent {
  final int code;
  final String name;
  final String email;
  final String phone;
  final String cpf;
  final String bloodType;
  final String dateBirth;
  final String isAssociated;

  Dependent(this.code, this.name, this.email, this.phone, this.cpf,
      this.bloodType, this.dateBirth, this.isAssociated);

  Dependent.fromJson(Map<String, dynamic> json)
      : code = json['codigo'],
        name = json['nome'],
        email = json['email'],
        phone = json['telefone'],
        cpf = json['cpf'],
        bloodType = json['tipoSanguineo'],
        dateBirth = json['dataNascimento'],
        isAssociated = json['membroHc'];

  Map<String, dynamic> toJson() => {
        'codigo': code,
        'nome': name,
        'email': email,
        'telefone': phone,
        'cpf': cpf,
        'tipoSanguineo': bloodType,
        'dataNascimento': dateBirth,
        'membroHc': isAssociated,
      };

  @override
  String toString() {
    return 'Dependente{codigo: $code, nome: $name, email: $email, telefone: $phone, '
        'cpf: $cpf, tipoSanguineo: $bloodType, dataNascimento: $dateBirth, '
        'membroHc: $isAssociated}';
  }
}
