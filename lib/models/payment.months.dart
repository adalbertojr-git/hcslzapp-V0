/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe do objeto MesesMensalidade

*/
class MesesMensalidade {
  final int codigo;
  final int mes;

  MesesMensalidade(this.codigo, this.mes);

  MesesMensalidade.fromJson(Map<String, dynamic> json)
      : codigo = json['codigo'],
        mes = json['mes'];

  Map<String, dynamic> toJson() => {
    'codigo': codigo,
    'mes': mes,
  };

  @override
  String toString() {
    return 'MesesMensalidade{codigo: $codigo, mes: $mes}';
  }
}
