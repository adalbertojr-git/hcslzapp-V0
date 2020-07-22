/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe do objeto Motocicleta

*/
class Motocicleta {
  final int codigo;
  final String modelo;
  final String ano;
  final String cor;
  final String placa;
  final String apelido;
  final String chassi;
  final String renavam;

  Motocicleta(this.codigo, this.modelo, this.ano, this.cor, this.placa,
      this.apelido, this.chassi, this.renavam);

  Motocicleta.fromJson(Map<String, dynamic> json)
      : codigo = json['codigo'],
        modelo = json['modelo'],
        ano = json['ano'],
        cor = json['cor'],
        placa = json['placa'],
        apelido = json['apelido'],
        chassi = json['chassi'],
        renavam = json['renavam'];

  Map<String, dynamic> toJson() => {
    'codigo': codigo,
    'modelo': modelo,
    'ano': ano,
    'cor': cor,
    'placa': placa,
    'apelido': apelido,
    'chassi': chassi,
    'renavam': renavam,
  };

  @override
  String toString() {
    return 'Motocicleta{codigo: $codigo, modelo: $modelo, ano: $ano, cor: $cor, '
        'placa: $placa, apelido: $apelido, '
        'chassi: $chassi, renavam: $renavam}';
  }
}
