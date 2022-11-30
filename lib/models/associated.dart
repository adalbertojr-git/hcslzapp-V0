import 'package:flutter/foundation.dart';

import 'dependent.dart';
import 'motorcycle.dart';
import 'authenticate.dart';

class Associated extends ChangeNotifier {
  final int id;
  String name;
  String email;
  String phone;
  String sponsor;
  String cnh;
  String cpf;
  String bloodType;
  String associatedType;
  String dateBirth;
  String dateShield;
  String status;
  String photoUrl;
  List<Dependent> dependents;
  List<Motorcycle> motorcycles;
  Authenticate authenticate;

  Associated({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.sponsor,
    required this.cnh,
    required this.cpf,
    required this.bloodType,
    required this.associatedType,
    required this.dateBirth,
    required this.dateShield,
    required this.status,
    required this.photoUrl,
    required this.dependents,
    required this.motorcycles,
    required this.authenticate,
  });

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
        dateBirth = json['dateBirth'],
        dateShield = json['dateShield'],
        status = json['status'],
        photoUrl = json['photoUrl'],
        dependents = List.from((json['dependents'] as List)
            .map((dependents) => Dependent.fromJson(dependents))),
        motorcycles = List.from((json['motorcycles'] as List)
            .map((motorcycles) => Motorcycle.fromJson(motorcycles))),
        authenticate = Authenticate.fromJson(json['authenticate']);

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
        'dateBirth': dateBirth,
        'dateShield': dateShield,
        'status': status,
        'photoUrl': photoUrl,
        'dependents': List<dynamic>.from(
            dependents.map((dependents) => dependents.toJson())),
        'motorcycles': List<dynamic>.from(
            motorcycles.map((motorcycles) => motorcycles.toJson())),
        'authenticate': authenticate.toJson(),
      };

  @override
  String toString() {
    return 'Associated{id: $id, name: $name, email: $email, phone: $phone, '
        'cnh: $cnh, cpf: $cpf, '
        'bloodType: $bloodType, dateBirth: $dateBirth, '
        'dateShield: $dateShield, status: $status, photoUrl: $photoUrl, '
        'dependents: $dependents, motorcycles: $motorcycles,  authenticate: $authenticate}';
  }
}
