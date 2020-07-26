import 'package:flutter/material.dart';
import 'package:hcslzapp/components/text.field.dart';

const _rotuloModelo = 'Motocicleta *';
const _rotuloAno = 'Ano de Fabricaçao*';
const _rotuloDefeito = 'Defeito *';
const _rotuloSolucao = 'Solucao *';
const _rotuloProprietario = 'Proprietario';
const _rotuloTelefone = 'Telefone';

class DefectAdd extends StatelessWidget {
  final TextEditingController _controladorModelo = TextEditingController();
  final TextEditingController _controladorAno = TextEditingController();
  final TextEditingController _controladorDefeito = TextEditingController();
  final TextEditingController _controladorSolucao = TextEditingController();
  final TextEditingController _controladorProprietario = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();

  String _nome;

  //@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Editor(
                        controlador: _controladorModelo,
                        rotulo: _rotuloModelo,
                        icone: Icons.motorcycle,
                        inputType: TextInputType.text,
                      ),
                    ),
                    Expanded(
                      child: Editor(
                        controlador: _controladorAno,
                        icone: Icons.calendar_today,
                        rotulo: _rotuloAno,
                        inputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Editor(
                  controlador: _controladorDefeito,
                  rotulo: _rotuloDefeito,
                  inputType: TextInputType.text,
                  nLinhas: 2,
                ),
                Editor(
                  controlador: _controladorSolucao,
                  rotulo: _rotuloSolucao,
                  inputType: TextInputType.text,
                  nLinhas: 5,
                ),
                Editor(
                  controlador: _controladorProprietario,
                  rotulo: _rotuloProprietario,
                  icone: Icons.person,
                  inputType: TextInputType.text,
                ),
                Editor(
                  controlador: _controladorTelefone,
                  rotulo: _rotuloTelefone,
                  icone: Icons.phone,
                  inputType: TextInputType.phone,
                ),

                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50.0,
                  child: RaisedButton(
                    padding: EdgeInsets.all(0.0),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.white30),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.deepOrange],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight,
                        ),
                      ),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'CADASTRAR' + "  ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 17.0),
                          ),
                          Icon(
                            Icons.add_circle,
                            color: Colors.white30,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                    },
                  ),
                ),
              ],
            ),
          ),
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
