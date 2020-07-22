/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que permite ao associado, qdo em seu primeiro acesso ao App,
solicitar a liberacao do seu acesso a administracao do App

*/
import 'package:flutter/material.dart';
import 'package:hcslzapp/components/appBar.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/text_field.dart';

const _tituloAppBar = 'Solicitar Acesso';
const _rotuloNome = 'Nome *';
const _rotuloTelefone = 'Telefone *';
const _rotuloEmail = 'Email *';
const _rotuloPadrinho = 'Padrinho';

class SolicitarAcessoAssociado extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorPadrinho = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_tituloAppBar),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorNome,
                rotulo: _rotuloNome,
                icone: Icons.person,
                inputType: TextInputType.text,
              ),
              Editor(
                controlador: _controladorEmail,
                rotulo: _rotuloEmail,
                icone: Icons.email,
                inputType: TextInputType.emailAddress,
              ),
              Editor(
                controlador: _controladorTelefone,
                rotulo: _rotuloTelefone,
                icone: Icons.phone,
                inputType: TextInputType.phone,
              ),
              Editor(
                controlador: _controladorPadrinho,
                rotulo: _rotuloPadrinho,
                icone: Icons.person_pin,
                //inputType: TextInputType.text,
                desabilitado: true,
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Botao(
                'ENVIAR',
                Icons.send,
                onClick: () {
                  _solicitarCadastro(context);
                },
              ),
              //Info(),
            ],
          ),
        ),
      ),
    );
  }

  void _solicitarCadastro(BuildContext context) {}
}

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      width: MediaQuery.of(context).size.width - 15,
      height: MediaQuery.of(context).size.height - 360,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.orangeAccent),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(00.0, 5.0, 00.0, 0.0),
              child: new Image.asset('assets/imgs/info.png'),
            ),
            const ListTile(
              title: Text(
                'Aviso:',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
              subtitle: Text(
                'Assim que sua solicitacao for aprovada pela Diretoria, voce '
                'recebera um email com dados para acesso. '
                'Verifique tambem sua caixa de spam.',
                style: TextStyle(color: Colors.black),
              ),
              isThreeLine: true,
            ),
          ],
        ),
      ),
    );
  }
}
