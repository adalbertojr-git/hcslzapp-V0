/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe do objeto Mensalidade

*/
import 'payment.months.dart';

class Payment {
  final int code;
  final String year;
  final List<PaymentMonths> paymentMonths;

  Payment(this.code, this.year, this.paymentMonths);

  Payment.fromJson(Map<String, dynamic> json)
      : code = json['codigo'],
        year = json['ano'],
        paymentMonths = List.from((json['mesesMensalidades'] as List)
            .map((mesesMensalidades) => PaymentMonths.fromJson(mesesMensalidades)));

  Map<String, dynamic> toJson() => {
    'codigo': code,
    'ano': year,
    'mesesMensalidades': List<dynamic>.from(
        paymentMonths.map((mesesMensalidades) => mesesMensalidades.toJson())),
  };

  @override
  String toString() {
    return 'Mensalidade{codigo: $code, ano: $year, mesesMensalidades: $paymentMonths}';
  }
}
