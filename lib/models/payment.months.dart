class PaymentMonths {
  int id;
  int month;
  double value;

  PaymentMonths({this.id, this.month, this.value});

  PaymentMonths.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        month = json['month'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'month': month,
    'value': value,
  };

  @override
  String toString() {
    return 'PaymentMonths{id: $id, month: $month, value: $value}';
  }
}
