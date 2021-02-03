import 'package:hcslzapp/models/associated.dart';
import 'payment.months.dart';

class Payment {
  final int id;
  final String year;
  final Associated associated;
  final List<PaymentMonths> paymentMonths;

  Payment(this.id, this.year, this.associated, this.paymentMonths);

  Payment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        year = json['year'],
        associated = Associated.fromJson(json['associated']),
        paymentMonths = List.from((json['paymentMonths'] as List)
            .map((paymentMonths) => PaymentMonths.fromJson(paymentMonths)));

  Map<String, dynamic> toJson() => {
        'id': id,
        'year': year,
        'associated': associated.toJson(),
        'paymentMonths': List<dynamic>.from(
            paymentMonths.map((paymentMonths) => paymentMonths.toJson())),
      };

  @override
  String toString() {
    return 'Payment{id: $id, year: $year, associated: $associated, paymentMonths: $paymentMonths}';
  }
}
