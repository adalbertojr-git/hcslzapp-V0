class Motorcycle {
  final int id;
  final String model;
  final String year;
  final String color;
  final String licencePlate;
  final String nickname;
  final String chassis;
  final String renavam;

  Motorcycle(this.id, this.model, this.year, this.color, this.licencePlate,
      this.nickname, this.chassis, this.renavam);

  Motorcycle.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        model = json['model'],
        year = json['year'],
        color = json['color'],
        licencePlate = json['licencePlate'],
        nickname = json['nickname'],
        chassis = json['chassis'],
        renavam = json['renavam'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'model': model,
    'year': year,
    'color': color,
    'licencePlate': licencePlate,
    'nickname': nickname,
    'chassis': chassis,
    'renavam': renavam,
  };

  @override
  String toString() {
    return 'Motocicleta{codigo: $id, modelo: $model, ano: $year, cor: $color, '
        'placa: $licencePlate, apelido: $nickname, '
        'chassi: $chassis, renavam: $renavam}';
  }
}
