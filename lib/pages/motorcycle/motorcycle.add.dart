import 'package:flutter/material.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.appbar.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/components/top.space.dart';
import 'package:hcslzapp/models/motorcycle.dart';

const _tituloAppBar = 'Motocicleta';
const _rotuloModelo = 'Modelo *';
const _rotuloAno = 'Ano';
const _rotuloCor = 'Cor';
const _rotuloPlaca = 'Placa';
const _rotuloApelido = 'Apelido';
const _rotuloChassi = 'Chassi';
const _rotuloRenavam = 'Renavam';

class MotorcycleAdd extends StatelessWidget {
  final TextEditingController _controladorCodigo = TextEditingController();
  final TextEditingController _controladorModelo = TextEditingController();
  final TextEditingController _controladorAno = TextEditingController();
  final TextEditingController _controladorCor = TextEditingController();
  final TextEditingController _controladorPlaca = TextEditingController();
  final TextEditingController _controladorApelido = TextEditingController();
  final TextEditingController _controladorChassi = TextEditingController();
  final TextEditingController _controladorRenavam = TextEditingController();
  String _nome;

  //@override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: MyAppBar(_tituloAppBar),
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
                TopSpace(),
                InputTextField(
                  controlller: _controladorModelo,
                  label: _rotuloModelo,
                  icon: Icons.motorcycle,
                  inputType: TextInputType.text,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: InputTextField(
                        controlller: _controladorAno,
                        icon: Icons.calendar_today,
                        label: _rotuloAno,
                        inputType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: InputTextField(
                        controlller: _controladorCor,
                        icon: Icons.color_lens,
                        label: _rotuloCor,
                        inputType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: InputTextField(
                        controlller: _controladorPlaca,
                        label: _rotuloPlaca,
                        inputType: TextInputType.text,
                      ),
                    ),
                    Expanded(
                      child: InputTextField(
                        controlller: _controladorApelido,
                        label: _rotuloApelido,
                        inputType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                InputTextField(
                  controlller: _controladorChassi,
                  label: _rotuloChassi,
                  inputType: TextInputType.text,
                ),
                InputTextField(
                  controlller: _controladorRenavam,
                  label: _rotuloRenavam,
                  inputType: TextInputType.text,
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Button(
                  Icons.save,
                  onClick: () {
                    _save(context);
                  },
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

  void _save(BuildContext context) {
    final int codigo = int.parse(_controladorCodigo.text);
    final String modelo = _controladorModelo.text;
    final String ano = _controladorAno.text;
    final String cor = _controladorCor.text;
    final String placa = _controladorPlaca.text;
    final String apelido = _controladorApelido.text;
    final String chassi = _controladorChassi.text;
    final String renavam = _controladorRenavam.text;

    if (modelo != '') {
      final motocicletaCriada =
          Motorcycle(codigo, modelo, ano, cor, placa, apelido, chassi, renavam);
      debugPrint('Criando motocicleta...');
      debugPrint('$motocicletaCriada');
      /*
      pop = manda resposta para o push (then)
      remove a tela da pilha de navegação. Ou seja, o push() adiciona uma tela
      à pilha, e o pop() a remove.
      */
      Navigator.pop(context, motocicletaCriada);
    }
  }
}
