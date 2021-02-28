import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/controllers/digital.identity.controller.dart';
import 'dart:io';

class DigitalIdentity extends StatefulWidget {
  @override
  _DigitalIdentityState createState() => _DigitalIdentityState();
}

class _DigitalIdentityState extends State<DigitalIdentity> {
  DigitalIdentityController _controller = DigitalIdentityController();
  final double _fontSize = 16.0;

  @override
  void initState() {
    _controller.init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets,
    );
  }

  get _widgets =>
    Stack(
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
                  SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: _photo,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  MyTextFormField(
                    textEditingController: _controller.nameCtrl,
                    label: labelName,
                    disabled: true,
                    size: _fontSize,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MyTextFormField(
                          textEditingController: _controller.associatedTypeCtrl,
                          label: labelAssociatedType,
                          disabled: true,
                          size: _fontSize,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: MyTextFormField(
                          textEditingController: _controller.cnhCtrl,
                          label: labelCNH,
                          disabled: true,
                          size: _fontSize,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: MyTextFormField(
                          textEditingController: _controller.cpfCtrl,
                          label: labelCPF,
                          disabled: true,
                          size: _fontSize,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: MyTextFormField(
                            textEditingController: _controller.dateBirthCtrl,
                            label: labelDateBirth,
                            disabled: true,
                            size: _fontSize,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: MyTextFormField(
                            textEditingController: _controller.dateShieldCtrl,
                            label: labelDateShield,
                            disabled: true,
                            size: _fontSize,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: MyTextFormField(
                            textEditingController: _controller.nameCtrl,
                            label: 'A-',
                            disabled: true,
                            size: _fontSize,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                    height: 40.0,
                  ),
                  Center(
                    child: Text(
                      'Carteira digital de associado do Harley Club de São Luis - MA',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      'Válida até 31/12/2020',
                      style: TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );

  get _photo => Container(
    height: 200.0,
    width: 200.0,
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.2),
      borderRadius: BorderRadius.circular(100.0),
    ),
    child: Observer(
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(150.0),
          image: _loadPhoto(),
        ),
      ),
    ),
  );

  DecorationImage _loadPhoto() => DecorationImage(
      image: _controller.photoPath != null
          ? PhotoImageProvider().getImageProvider(
        File(_controller.photoPath),
      )
          : PhotoImageProvider().getImageProvider(
        File('assets/imgs/noImage.png'),
      ),
      fit: BoxFit.fill);

/*  Container _photo() {
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
  }*/
}
