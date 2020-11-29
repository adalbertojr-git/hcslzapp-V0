class PaymentMonths {
  final int id;
  final int month;

  PaymentMonths(this.id, this.month);

  PaymentMonths.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        month = json['month'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'month': month,
  };

  @override
  String toString() {
    return 'MesesMensalidade{id: $id, month: $month}';
  }
}
