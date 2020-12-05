class Motorcycle {
  final int id;
  String model;
  String year;
  String color;
  String licencePlate;
  String nickname;
  String chassis;
  String renavam;

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
    return 'Motorcycle{id: $id, model: $model, year: $year, color: $color, '
        'licencePlate: $licencePlate, nickname: $nickname, '
        'chassis: $chassis, renavam: $renavam}';
  }
}
