import 'package:flutter/material.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';

const _rotuloModelo = 'Motocicleta *';
const _rotuloAno = 'Ano de Fabricaçao*';
const _rotuloDefeito = 'Defeito *';
const _rotuloSolucao = 'Solucao *';
const _rotuloProprietario = 'Proprietario';
const _rotuloTelefone = 'Telefone';

class DefectAddPage extends StatelessWidget {
  final TextEditingController _controladorModelo = TextEditingController();
  final TextEditingController _controladorAno = TextEditingController();
  final TextEditingController _controladorDefeito = TextEditingController();
  final TextEditingController _controladorSolucao = TextEditingController();
  final TextEditingController _controladorProprietario = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();

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
                      child: MyTextFormField(
                        textEditingController: _controladorModelo,
                        helper: _rotuloModelo,
                        icon: Icons.motorcycle,
                        inputType: TextInputType.text,
                      ),
                    ),
                    Expanded(
                      child: MyTextFormField(
                        textEditingController: _controladorAno,
                        icon: Icons.calendar_today,
                        helper: _rotuloAno,
                        inputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                MyTextFormField(
                  textEditingController: _controladorDefeito,
                  helper: _rotuloDefeito,
                  inputType: TextInputType.text,
                  nLines: 2,
                ),
                MyTextFormField(
                  textEditingController: _controladorSolucao,
                  helper: _rotuloSolucao,
                  inputType: TextInputType.text,
                  nLines: 5,
                ),
                MyTextFormField(
                  textEditingController: _controladorProprietario,
                  helper: _rotuloProprietario,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                ),
                MyTextFormField(
                  textEditingController: _controladorTelefone,
                  helper: _rotuloTelefone,
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
        icon: Icons.save,
        onClick: () {},
      ),
    );
  }

}
