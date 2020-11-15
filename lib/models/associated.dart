import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';

class Associated {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String sponsor;
  final String cnh;
  final String cpf;
  final String bloodType;
  final String associatedType;
  final String dateBirth;
  final String dateShield;
  final List<Dependent> dependents;
  final List<Motorcycle> motorcycles;

  Associated(
      this.id,
      this.name,
      this.email,
      this.phone,
      this.sponsor,
      this.cnh,
      this.cpf,
      this.bloodType,
      this.associatedType,
      this.dateBirth,
      this.dateShield,
      this.dependents,
      this.motorcycles);

  Associated.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        sponsor = json["sponsor"],
        cnh = json['cnh'],
        cpf = json['cpf'],
        bloodType = json['bloodType'],
        associatedType = json['associatedType'],
        dateBirth = json['dateBirthToString'],
        dateShield = json['dateShieldToString'],
        dependents = List.from((json['associatedDependents'] as List)
            .map((dependents) => Dependent.fromJson(dependents))),
        motorcycles = List.from((json['associatedMotorcycles'] as List)
            .map((motorcycles) => Motorcycle.fromJson(motorcycles)));

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'sponsor': sponsor,
        'cnh': cnh,
        'cpf': cpf,
        'bloodType': bloodType,
        'associatedType': associatedType,
        'dateBirthToString': dateBirth,
        'dateShieldToString': dateShield,
        'associatedDependents': List<dynamic>.from(
            dependents.map((dependents) => dependents.toJson())),
        'associatedMotorcycles': List<dynamic>.from(
            motorcycles.map((motorcycles) => motorcycles.toJson())),
      };

  @override
  String toString() {
    return 'Associado{codigo: $id, nome: $name, email: $email, telefone: $phone, '
        'cnh: $cnh, cpf: $cpf, '
        'tipoSanguineo: $bloodType, dataNascimento: $dateBirth, '
        'dataEscudamento: $dateShield}';
  }
}