import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/digital.identity.controller.dart';
import 'dart:io';

import 'package:hcslzapp/models/digital.identity.dart';

class DigitalIdentityPage extends StatefulWidget {
  final int _associatedId;

  DigitalIdentityPage(this._associatedId);

  @override
  _DigitalIdentityPageState createState() => _DigitalIdentityPageState();
}

class _DigitalIdentityPageState extends State<DigitalIdentityPage> {
  DigitalIdentityController _controller = DigitalIdentityController();
  final double _fontSize = 14.0;

  @override
  void initState() {
    _controller.getFuture(widget._associatedId).then((value) {
      if (value != null && value.isNotEmpty) {
        _controller.setButtonVisibilty();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          body: FutureBuilder<List<DigitalIdentity>>(
            future: _controller.future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Progress();
                case ConnectionState.active:
                  break;
                default:
                  if (snapshot.hasError) {
                    return CenteredMessage(snapshot.error.toString());
                  } else {
                    if (snapshot.data == null)
                      return CenteredMessage(
                        _controller.errorMsg,
                      );
                    if (snapshot.data.length > 0) {
                      _controller.digitalIdentity = snapshot.data.first;
                      _controller.init();
                      return _widgets();
                    } else
                      return CenteredMessage(
                        'Identidade Digital não disponível. Consulte suas mensalidades junto à Diretoria.',
                      );
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                'Houve um erro desconhecido ao executar a transação.',
              );
            },
          ),
        ),
      );

  _widgets() => Container(
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
            children: [
              TopBar(),
              Center(
                child: _photo(),
              ),
              SizedBox(
                height: 5.0,
              ),
              MyTextFormField(
                textEditingController: _controller.nameCtrl,
                label: labelNameDigitalPayment,
                disabled: true,
                fontSize: _fontSize,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.associatedTypeCtrl,
                      label: labelAssociatedType,
                      disabled: true,
                      fontSize: _fontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.cnhCtrl,
                      label: labelCNH,
                      disabled: true,
                      fontSize: _fontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.cpfCtrl,
                      label: labelCPF,
                      disabled: true,
                      fontSize: _fontSize,
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
                      fontSize: _fontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.dateShieldCtrl,
                      label: labelDateShield,
                      disabled: true,
                      fontSize: _fontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.bloodTypeCtrl,
                      label: labelBloodType,
                      disabled: true,
                      fontSize: _fontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 130.0,
                      child: Image.asset('assets/imgs/logo_carteirad.png'),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 110.0,
                      ),
                      Center(
                        child: Text(
                          'Carteira digital de associado do Harley Club de São Luis - MA',
                          style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Center(
                        child: Text(
                          'Válida até ${_controller.dueDateCtrl.text}',
                          style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  _photo() => Container(
        height: 250.0,
        width: 250.0,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(150.0),
        ),
        child: Observer(
          builder: (_) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(200.0),
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
}
