import 'package:flutter/material.dart';
import 'package:hcslzapp/components/input.textfield.dart';

const _labelName = 'Nome';
const _labelDateBirth = 'Data Nascimento';
const _labelDateShield = 'Data Escudamento';
const _labelBloodType = 'Tipo Sanguineo';

class DigitalIdentity extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: SizedBox(
              height: 370.0,
              child: Padding(
                padding: EdgeInsets.fromLTRB(00.0, 10.0, 00.0, 0.0),
                child: Image.asset('assets/imgs/logo_carteirad.png'),
              ),
            ),
          ),
          Center(
            child: Container(
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
                     SizedBox (
                       height: 30.0,
                     ),
                    Center(
                      child: _photo(),
                    ),
                    SizedBox (
                      height: 50.0,
                    ),
                    InputTextField(
                      helper: _labelName,
                      label: 'Adalberto Jr', //associated.name,
                      disabled: true,
                      size: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: InputTextField(
                            helper: _labelDateBirth,
                            label: '28/09/1976', //associated.name,
                            disabled: true,
                            size: 15.0,
                          ),
                        ),
                        Expanded(
                          child: InputTextField(
                            helper: _labelDateShield,
                            label: '27/07/2019', //associated.name,
                            disabled: true,
                            size: 15.0,
                          ),
                        ),
                        Expanded(
                          child: InputTextField(
                            helper: _labelBloodType,
                            label: 'A-', //associated.name,
                            disabled: true,
                            size: 15.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox (
                      height: 40.0,
                    ),
                    Center(
                      child: Text (
                          'Carteira digital de membro do Harley Club de Sao Luis - MA',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        'Valida ate 31/12/2020',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _photo() {
    return Container(
      height: 250.0,
      width: 250.0,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(150.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(150.0),
          image: DecorationImage(
            image: AssetImage('assets/imgs/eu.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
