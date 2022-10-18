import 'package:hcslzapp/models/digital.identity.dart';

import 'role.dart';
import 'associated.dart';
import 'authenticate.dart';
import 'dependent.dart';
import 'motorcycle.dart';

class Template {
  Associated loadAssociated() => Associated(
        id: 0,
        name: '',
        email: '',
        phone: '',
        sponsor: '',
        cnh: '',
        cpf: '',
        bloodType: '',
        associatedType: '',
        dateBirth: '',
        dateShield: '',
        status: '',
        photoUrl: '',
        dependents: List<Dependent>.from([]),
        motorcycles: List<Motorcycle>.from([]),
        authenticate: Authenticate(
          id: 0,
          roles: List<Role>.from([]),
          username: '',
        ),
      );

  Dependent loadDependent() => Dependent(
        id: 0,
        name: '',
        email: '',
        phone: '',
        cpf: '',
        bloodType: '',
        dateBirth: '',
        isAssociated: '',
      );

  Motorcycle loadMotorcycle() => Motorcycle(
        id: 0,
        model: '',
        year: '',
        color: '',
        licencePlate: '',
        nickname: '',
        chassis: '',
        renavam: '',
      );

  DigitalIdentity loadDigitalIdentity() => DigitalIdentity(
        id: 0,
        name: '',
        cnh: '',
        cpf: '',
        bloodType: '',
        associatedType: '',
        dateBirth: '',
        dateShield: '',
        dueDate: '',
        dependents: List<Dependent>.from([]),
        motorcycles: List<Motorcycle>.from([]),
      );
}
