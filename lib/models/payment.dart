import 'payment.months.dart';

class Payment {
  final int id;
  final String year;
  final List<PaymentMonths> paymentMonths;

  Payment(this.id, this.year, this.paymentMonths);

  Payment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        year = json['year'],
        paymentMonths = List.from((json['paymentMonths'] as List)
            .map((paymentMonths) => PaymentMonths.fromJson(paymentMonths)));

  Map<String, dynamic> toJson() => {
        'id': id,
        'year': year,
        'paymentMonths': List<dynamic>.from(
            paymentMonths.map((paymentMonths) => paymentMonths.toJson())),
      };

  @override
  String toString() {
    return 'Payment{id: $id, year: $year, paymentMonths: $paymentMonths}';
  }
}
