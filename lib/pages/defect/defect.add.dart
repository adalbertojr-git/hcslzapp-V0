import 'package:flutter/material.dart';
import 'package:hcslzapp/components/button.dart';
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
                SizedBox (
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: InputTextField(
                        controller: _controladorModelo,
                        label: _rotuloModelo,
                        icon: Icons.motorcycle,
                        inputType: TextInputType.text,
                      ),
                    ),
                    Expanded(
                      child: InputTextField(
                        controller: _controladorAno,
                        icon: Icons.calendar_today,
                        label: _rotuloAno,
                        inputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                InputTextField(
                  controller: _controladorDefeito,
                  label: _rotuloDefeito,
                  inputType: TextInputType.text,
                  nLines: 2,
                ),
                InputTextField(
                  controller: _controladorSolucao,
                  label: _rotuloSolucao,
                  inputType: TextInputType.text,
                  nLines: 5,
                ),
                InputTextField(
                  controller: _controladorProprietario,
                  label: _rotuloProprietario,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                ),
                InputTextField(
                  controller: _controladorTelefone,
                  label: _rotuloTelefone,
                  icon: Icons.phone,
                  inputType: TextInputType.phone,
                ),

                Padding(
                  padding: EdgeInsets.all(5.0),
                ),

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Button(
        Icons.save,
        onClick: () {},
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
