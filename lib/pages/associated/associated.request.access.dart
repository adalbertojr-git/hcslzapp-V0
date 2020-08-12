/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que permite ao associado, qdo em seu primeiro acesso ao App,
solicitar a liberacao do seu acesso a administracao do App

*/
import 'package:flutter/material.dart';
import 'package:hcslzapp/components/my.appbar.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/components/top.space.dart';

const _titleAppBar = 'Solicitar Acesso';
const _labelName = 'Nome *';
const _labelPhone = 'Telefone *';
const _labelEmail = 'Email *';
const _labelSponsor = 'Padrinho';

class AssociatedRequestAccess extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSponsor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: MyAppBar(_titleAppBar),
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
              TopSpace(),
              InputTextField(
                controlller: _controllerName,
                label: _labelName,
                icon: Icons.person,
                inputType: TextInputType.text,
              ),
              InputTextField(
                controlller: _controllerEmail,
                label: _labelEmail,
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
              ),
              InputTextField(
                controlller: _controllerPhone,
                label: _labelPhone,
                icon: Icons.phone,
                inputType: TextInputType.phone,
              ),
              InputTextField(
                controlller: _controllerSponsor,
                label: _labelSponsor,
                icon: Icons.person_pin,
                //inputType: TextInputType.text,
                disabled: true,
              ),
              Button(
                Icons.send,
                onClick: () {
                  _sendRequest(context);
                },
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              Info(),
            ],
          ),
        ),
      ),
    );
  }

  void _sendRequest(BuildContext context) {}
}

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 15,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.black),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Image.asset(
                'assets/imgs/info.png',
                height: 50.0,
              ),
            ),
            const ListTile(
              title: Text(
                'Atenção:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              subtitle: Text(
                'Voce recebera um email com instruçoes de acesso. '
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
