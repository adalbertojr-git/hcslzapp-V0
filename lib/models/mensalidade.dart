/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe do objeto Mensalidade

*/
import 'meses_mensalidade.dart';

class Mensalidade {
  final int codigo;
  final String ano;
  final List<MesesMensalidade> mesesMensalidades;

  Mensalidade(this.codigo, this.ano, this.mesesMensalidades);

  Mensalidade.fromJson(Map<String, dynamic> json)
      : codigo = json['codigo'],
        ano = json['ano'],
        mesesMensalidades = List.from((json['mesesMensalidades'] as List)
            .map((mesesMensalidades) => MesesMensalidade.fromJson(mesesMensalidades)));

  Map<String, dynamic> toJson() => {
    'codigo': codigo,
    'ano': ano,
    'mesesMensalidades': List<dynamic>.from(
        mesesMensalidades.map((mesesMensalidades) => mesesMensalidades.toJson())),
  };

  @override
  String toString() {
    return 'Mensalidade{codigo: $codigo, ano: $ano, mesesMensalidades: $mesesMensalidades}';
  }
}
