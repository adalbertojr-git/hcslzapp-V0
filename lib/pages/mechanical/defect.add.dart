import 'package:flutter/material.dart';
import 'package:hcslzapp/components/input.textfield.dart';

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
                      child: InputTextField(
                        controlller: _controladorModelo,
                        label: _rotuloModelo,
                        icon: Icons.motorcycle,
                        inputType: TextInputType.text,
                      ),
                    ),
                    Expanded(
                      child: InputTextField(
                        controlller: _controladorAno,
                        icon: Icons.calendar_today,
                        label: _rotuloAno,
                        inputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                InputTextField(
                  controlller: _controladorDefeito,
                  label: _rotuloDefeito,
                  inputType: TextInputType.text,
                  nLines: 2,
                ),
                InputTextField(
                  controlller: _controladorSolucao,
                  label: _rotuloSolucao,
                  inputType: TextInputType.text,
                  nLines: 5,
                ),
                InputTextField(
                  controlller: _controladorProprietario,
                  label: _rotuloProprietario,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                ),
                InputTextField(
                  controlller: _controladorTelefone,
                  label: _rotuloTelefone,
                  icon: Icons.phone,
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
