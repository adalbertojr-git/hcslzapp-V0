import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/digital.identity.controller.dart';
import 'package:hcslzapp/models/associated.dart';

class DigitalIdentityPage extends StatefulWidget {
  final Associated _associated;

  DigitalIdentityPage(this._associated);

  @override
  _DigitalIdentityPageState createState() => _DigitalIdentityPageState();
}

class _DigitalIdentityPageState extends State<DigitalIdentityPage> {
  DigitalIdentityController _controller = DigitalIdentityController();
  final double _fontSize = 14.0;

  @override
  void initState() {
    _controller.associated = widget._associated;
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: _widgets(),
        );
      },
    );
  }

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
                      height: 100.0,
                      child: Image.asset('assets/imgs/logo_carteirad.png'),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 90.0,
                      ),
                      Center(
                        child: Text(
                          'Carteira digital de associado do Harley Club de São Luis - MA',
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
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
        height: 170.0,
        width: 170.0,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.0),
            image: _loadPhoto(),
          ),
        ),
      );

  DecorationImage _loadPhoto() => DecorationImage(
      image: widget._associated.photoUrl != null
          ? NetworkImage(widget._associated.photoUrl)
          : PhotoImageProvider().getImageProvider(
              File('assets/imgs/noImage.png'),
            ),
      fit: BoxFit.fill);
}
