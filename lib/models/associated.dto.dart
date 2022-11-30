import 'dependent.dart';
import 'motorcycle.dart';
import 'authenticate.dart';

class AssociatedDTO {
  int id;
  String name;
  String email;
  String phone;
  String status;
  String photoUrl;
  List<Dependent> dependents;
  List<Motorcycle> motorcycles;
  Authenticate authenticate;

  AssociatedDTO({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.photoUrl,
    required this.dependents,
    required this.motorcycles,
    required this.authenticate,
  });

  AssociatedDTO.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
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
        'status': status,
        'photoUrl': photoUrl,
        'dependents': List<dynamic>.from(
            dependents.map((dependents) => dependents.toJson())),
        'motorcycles': List<dynamic>.from(
            motorcycles.map((motorcycles) => motorcycles.toJson())),
        'authenticate': authenticate.toJson(),
      };
}
