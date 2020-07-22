import 'package:flutter/material.dart';
import 'package:hcslzapp/components/appBar.dart';
import 'package:hcslzapp/components/text_field.dart';
import 'package:hcslzapp/models/motocicleta.dart';

const _tituloAppBar = 'Motocicleta';
const _rotuloModelo = 'Modelo *';
const _rotuloAno = 'Ano';
const _rotuloCor = 'Cor';
const _rotuloPlaca = 'Placa';
const _rotuloApelido = 'Apelido';
const _rotuloChassi = 'Chassi';
const _rotuloRenavam = 'Renavam';

class CadastrarMotocicleta extends StatelessWidget {
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
      appBar: MyAppBar(_tituloAppBar),
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
                Editor(
                  controlador: _controladorModelo,
                  rotulo: _rotuloModelo,
                  icone: Icons.motorcycle,
                  inputType: TextInputType.text,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Editor(
                        controlador: _controladorAno,
                        icone: Icons.calendar_today,
                        rotulo: _rotuloAno,
                        inputType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: Editor(
                        controlador: _controladorCor,
                        icone: Icons.color_lens,
                        rotulo: _rotuloCor,
                        inputType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Editor(
                        controlador: _controladorPlaca,
                        rotulo: _rotuloPlaca,
                        inputType: TextInputType.text,
                      ),
                    ),
                    Expanded(
                      child: Editor(
                        controlador: _controladorApelido,
                        rotulo: _rotuloApelido,
                        inputType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                Editor(
                  controlador: _controladorChassi,
                  rotulo: _rotuloChassi,
                  inputType: TextInputType.text,
                ),
                Editor(
                  controlador: _controladorRenavam,
                  rotulo: _rotuloRenavam,
                  inputType: TextInputType.text,
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
                      _criaMotocicleta(context);
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

  void _criaMotocicleta(BuildContext context) {
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
          Motocicleta(codigo, modelo, ano, cor, placa, apelido, chassi, renavam);
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
