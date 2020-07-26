/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: enum com tipos sanguineos

*/
enum TipoSanguineo {
  A_POSITIVO,
  A_NEGATIVO,
  B_POSITIVO,
  B_NEGATIVO,
  O_POSITIVO,
  O_NEGATIVO,
  AB_POSITIVO,
  AB_NEGATIVO,
}

extension TipoSanguineoExt on TipoSanguineo {
  static const tiposSanguineosMap = {
    TipoSanguineo.A_NEGATIVO: "A-",
    TipoSanguineo.A_POSITIVO: "A+",
    TipoSanguineo.B_NEGATIVO: "B-",
    TipoSanguineo.B_POSITIVO: "B+",
    TipoSanguineo.O_NEGATIVO: "O-",
    TipoSanguineo.O_POSITIVO: "O+",
    TipoSanguineo.AB_NEGATIVO: "AB-",
    TipoSanguineo.AB_POSITIVO: "AB+",
  };

  //prints enum index and custom message
  void tipoSanguineoToString() {
    print("${this.index} ${this.descricao}");
  }

  //about property returns the custom message
  String get descricao => tiposSanguineosMap[this];
}