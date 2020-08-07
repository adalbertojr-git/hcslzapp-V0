/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: enum com tipos sanguineos

*/
enum BloodType {
  A_POSITIVE,
  A_NEGATIVE,
  B_POSITIVE,
  B_NEGATIVE,
  O_POSITIVE,
  O_NEGATIVE,
  AB_POSITIVE,
  AB_NEGATIVE,
}

extension BloodTypeExt on BloodType {
  static const bloodTypesMap = {
    BloodType.A_NEGATIVE: "A-",
    BloodType.A_POSITIVE: "A+",
    BloodType.B_NEGATIVE: "B-",
    BloodType.B_POSITIVE: "B+",
    BloodType.O_NEGATIVE: "O-",
    BloodType.O_POSITIVE: "O+",
    BloodType.AB_NEGATIVE: "AB-",
    BloodType.AB_POSITIVE: "AB+",
  };

  //prints enum index and custom message
  void bloodTypeToString() {
    print("${this.index} ${this.description}");
  }

  //about property returns the custom message
  String get description => bloodTypesMap[this];
}