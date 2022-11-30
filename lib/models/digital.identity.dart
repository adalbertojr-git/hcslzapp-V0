import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';

class DigitalIdentity {
  int id;
  String name;
  String associatedType;
  String cnh;
  String cpf;
  String bloodType;
  String dateBirth;
  String dateShield;
  String dueDate;
  List<Dependent> dependents;
  List<Motorcycle> motorcycles;

  DigitalIdentity({
    required this.id,
    required this.name,
    required this.cnh,
    required this.cpf,
    required this.bloodType,
    required this.associatedType,
    required this.dateBirth,
    required this.dateShield,
    required this.dueDate,
    required this.dependents,
    required this.motorcycles,
  });

  DigitalIdentity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        cnh = json['cnh'],
        cpf = json['cpf'],
        bloodType = json['bloodType'],
        associatedType = json['associatedType'],
        dateBirth = json['dateBirth'],
        dateShield = json['dateShield'],
        dueDate = json['dueDate'],
        dependents = List.from((json['dependents'] as List)
            .map((dependents) => Dependent.fromJson(dependents))),
        motorcycles = List.from((json['motorcycles'] as List)
            .map((motorcycles) => Motorcycle.fromJson(motorcycles)));

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'cnh': cnh,
        'cpf': cpf,
        'bloodType': bloodType,
        'associatedType': associatedType,
        'dateBirth': dateBirth,
        'dateShield': dateShield,
        'dueDate': dueDate,
        'dependents': List<dynamic>.from(
            dependents.map((dependents) => dependents.toJson())),
        'motorcycles': List<dynamic>.from(
            motorcycles.map((motorcycles) => motorcycles.toJson())),
      };

  @override
  String toString() {
    return 'DigitalIdentity{id: $id, name: $name, cnh: $cnh, cpf: $cpf, '
        'bloodType: $bloodType, dateBirth: $dateBirth, '
        'dateShield: $dateShield, dueDate: $dueDate, '
        'dependents: $dependents, motorcycles: $motorcycles}';
  }
}
