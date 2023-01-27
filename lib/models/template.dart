import 'package:hcslzapp/models/event.dart';
import 'package:hcslzapp/models/head.notification.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/models/payment.months.dart';
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

  Payment loadPayment() => Payment(
        id: 0,
        year: '',
        associated: this.loadAssociated(),
        paymentMonths: List<PaymentMonths>.from([]),
      );

  PaymentMonths loadPaymentMonths() => PaymentMonths(
        id: 0,
        month: 0,
        value: 0.0,
      );

  Partnership loadPartnership() => Partnership(
        id: 0,
        partner: '',
        phone1: '',
        phone2: '',
        address: '',
        promotion: '',
        status: '',
        photoUrl: '',
      );

  HeadNotification loadHeadNotification() => HeadNotification(
        id: 0,
        title: '',
        notification: '',
        datePublication: '',
        photoUrl: '',
      );

  Event loadEvent() => Event(
        id: 0,
        title: '',
        initialDate: '',
        endDate: '',
        description: '',
        photoUrl: '',
      );
}
