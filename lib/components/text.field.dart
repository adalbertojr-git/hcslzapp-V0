/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que cria um TextFormField padrao

Params:
controlador: mensagem exibida na tela (obrigatorio)
rotulo: icone exibido no objeto (opcional)
dica: tamanho do icone (opcional)
icone: tamanho da fonte da mensagem (opcional)
inputType: tipo de caracter de entrada (opcional)
oculto: se os caracteres digitados aparecerao em forma de *** (usado na psw)
desabilitado: nao permite digitacao
prefixo: caracteres especiais antes do texto (R$, (DDD), etc)
nLinhas: numero de linhas (semelhante ao Text Area)
valor: conteudo digitado

*/
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;
  final TextInputType inputType;
  final bool oculto;
  final bool desabilitado;
  final String prefixo;
  final int nLinhas;
  String valor;

  Editor(
      {this.controlador,
      this.rotulo,
      this.dica,
      this.icone,
      this.inputType,
      this.oculto,
      this.desabilitado,
      this.prefixo,
      this.valor,
      this.nLinhas});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          obscureText: oculto != null ? oculto : false,
          readOnly: desabilitado != null ? desabilitado : false,
          controller: controlador,
          style: TextStyle(
            fontSize: 15.0,
          ),
          decoration: InputDecoration(
            filled: nLinhas != null ? true : false,
            icon: icone != null
                ? Icon(
                    icone,
                    color: Colors.orange,
                  )
                : null,
            labelText: valor,
            hintText: dica,
            prefixText: prefixo,
            helperText: rotulo,
            helperStyle: TextStyle(fontSize: 9.0, color: Colors.indigo),
          ),
          keyboardType: inputType,
          onSaved: (String value) {
            valor = value;
            print('name=$valor');
          },
          validator: (value) {},
          maxLines: nLinhas != null ? nLinhas : 1,
        ),
      ),
    );
  }

  String _validaNome(String value) {
    if (value.isEmpty) return 'Nome is obrigatorio.';
    final RegExp nomeExp = RegExp(r'^[A-Za-z ]+$');
    if (!nomeExp.hasMatch(value))
      return 'Favor digitar somente caracteres alfabeticos.';
    return null;
  }
}
