/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe do objeto MesesMensalidade

*/
class PaymentMonths {
  final int code;
  final int month;

  PaymentMonths(this.code, this.month);

  PaymentMonths.fromJson(Map<String, dynamic> json)
      : code = json['codigo'],
        month = json['mes'];

  Map<String, dynamic> toJson() => {
    'codigo': code,
    'mes': month,
  };

  @override
  String toString() {
    return 'MesesMensalidade{codigo: $code, mes: $month}';
  }
}
