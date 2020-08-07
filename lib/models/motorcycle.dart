/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe do objeto Motocicleta

*/
class Motorcycle {
  final int code;
  final String model;
  final String year;
  final String color;
  final String licencePlate;
  final String nickname;
  final String chassis;
  final String renavam;

  Motorcycle(this.code, this.model, this.year, this.color, this.licencePlate,
      this.nickname, this.chassis, this.renavam);

  Motorcycle.fromJson(Map<String, dynamic> json)
      : code = json['codigo'],
        model = json['modelo'],
        year = json['ano'],
        color = json['cor'],
        licencePlate = json['placa'],
        nickname = json['apelido'],
        chassis = json['chassi'],
        renavam = json['renavam'];

  Map<String, dynamic> toJson() => {
    'codigo': code,
    'modelo': model,
    'ano': year,
    'cor': color,
    'placa': licencePlate,
    'apelido': nickname,
    'chassi': chassis,
    'renavam': renavam,
  };

  @override
  String toString() {
    return 'Motocicleta{codigo: $code, modelo: $model, ano: $year, cor: $color, '
        'placa: $licencePlate, apelido: $nickname, '
        'chassi: $chassis, renavam: $renavam}';
  }
}
