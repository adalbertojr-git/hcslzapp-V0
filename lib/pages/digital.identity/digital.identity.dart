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
      body: RotatedBox(
        quarterTurns: 1,
        child: Stack(
          children: <Widget>[
            Center(
              child: SizedBox(
                height: 370.0,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(00.0, 10.0, 00.0, 0.0),
                  child: Image.asset('assets/imgs/logo_carteirinha.png'),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white30, Colors.deepOrange],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                  ),
                ),
                //width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: _photo(),
                    ),
                    InputTextField(
                      label: _labelName,
                      valor: 'Adalberto Jr',//associated.name,
                      disabled: true,
                      size: 18.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: InputTextField(
                            label: _labelDateBirth,
                            valor: '28/09/1976',//associated.name,
                            disabled: true,
                            size: 15.0,
                          ),
                        ),
                        Expanded(
                          child: InputTextField(
                            label: _labelDateShield,
                            valor: '27/07/2019',//associated.name,
                            disabled: true,
                            size: 15.0,
                          ),
                        ),
                        Expanded(
                          child: InputTextField(
                            label: _labelBloodType,
                            valor: 'A-',//associated.name,
                            disabled: true,
                            size: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Container _photo() {
    return Container(
      height: 140.0,
      width: 140.0,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100.0),
          image: DecorationImage(
            image: AssetImage('assets/imgs/eu.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
