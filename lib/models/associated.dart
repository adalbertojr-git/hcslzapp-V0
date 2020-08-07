/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe do objeto Associado

*/
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';

class Associated {
  final int code;
  final String name;
  final String email;
  final String phone;
  final Associated sponsor;
  final String nickname;
  final String cnh;
  final String cpf;
  final String rg;
  final String bloodType;
  final String associatedType;
  final String dateBirth;
  final String dateShield;
  final List<Dependent> dependents;
  final List<Motorcycle> motorcycles;

  Associated(
      this.code,
      this.name,
      this.email,
      this.phone,
      this.sponsor,
      this.nickname,
      this.cnh,
      this.cpf,
      this.rg,
      this.bloodType,
      this.associatedType,
      this.dateBirth,
      this.dateShield,
      this.dependents,
      this.motorcycles);

  Associated.fromJson(Map<String, dynamic> json)
      : code = json['codigo'],
        name = json['nome'],
        email = json['email'],
        phone = json['telefone'],
        sponsor = json["padrinho"] == null ? null : Associated.fromJson(json["padrinho"]),
        nickname = json['apelido'],
        cnh = json['cnh'],
        cpf = json['cpf'],
        rg = json['rg'],
        bloodType = json['tipoSanguineo'],
        associatedType = json['tipoAssociado'],
        dateBirth = json['dataNascimento'],
        dateShield = json['dataEscudamento'],
        dependents = List.from((json['dependentes'] as List)
            .map((dependentes) => Dependent.fromJson(dependentes))),
        motorcycles = List.from((json['motocicletas'] as List)
            .map((motocicletas) => Motorcycle.fromJson(motocicletas)));

  Map<String, dynamic> toJson() => {
        'codigo': code,
        'nome': name,
        'email': email,
        'telefone': phone,
        'padrinho': sponsor == null ? null : sponsor.toJson(),
        'apelido': nickname,
        'cnh': cnh,
        'cpf': cpf,
        'rg': rg,
        'tipoSanguineo': bloodType,
        'tipoAssociado': associatedType,
        'dataNascimento': dateBirth,
        'dataEscudamento': dateShield,
        'dependentes': List<dynamic>.from(
            dependents.map((depedentes) => depedentes.toJson())),
        'motocicletas': List<dynamic>.from(
            motorcycles.map((motocicletas) => motocicletas.toJson())),
      };

  @override
  String toString() {
    return 'Associado{codigo: $code, nome: $name, email: $email, telefone: $phone, '
        'apelido: $nickname, cnh: $cnh, cpf: $cpf, rg: $rg, '
        'tipoSanguineo: $bloodType, dataNascimento: $dateBirth, '
        'dataEscudamento: $dateShield}';
  }
}