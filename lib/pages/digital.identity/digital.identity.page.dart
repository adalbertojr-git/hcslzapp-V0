import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/controllers/digital.identity.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/digital.identity.dart';
import '../../components/degradee.background.dart';
import '../../components/my.appbar.dart';

const String _labelNotExists =
    'Dados do associado especificado não foram encontrados.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _pathIdentity = 'assets/imgs/logo_carteirad.png';
const String _pathNoImage = 'assets/imgs/noImage.png';
const String _title = 'Carteira Harley Club';

class DigitalIdentityPage extends StatelessWidget {
  final Associated _associated;
  final DigitalIdentityController _controller = DigitalIdentityController();
  final double _fontSize = 14.0;

  DigitalIdentityPage(this._associated);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(_title),
        body: FutureBuilder<List<DigitalIdentity>>(
          future: _controller.getFuture(_associated.id),
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
                  return CenteredMessage(
                      title: _title, message: snapshot.error.toString());
                } else {
                  if (snapshot.data == null)
                    return CenteredMessage(
                      title: _title,
                      message: _controller.errorMsg,
                    );
                  if ((snapshot.data?.length)! > 0) {
                    _controller.digitalIdentity = (snapshot.data?.first)!;
                    _controller.init();
                    return _widgets();
                  } else
                    return CenteredMessage(
                      title: _title,
                      message: _labelNotExists,
                    );
                }
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              title: _title,
              message: _labelUnknown,
            );
          },
        ),
      );

  _widgets() => DegradeBackground(
        Center(
          child: ListView(
            shrinkWrap: true,
            children: [
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
                      child: Image.asset(_pathIdentity),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 90.0,
                      ),
                      Center(
                        child: const Text(
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
        height: 250.0,
        width: 250.0,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(130.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(130.0),
            image: _loadPhoto(),
          ),
        ),
      );

  DecorationImage _loadPhoto() => DecorationImage(
      image: _associated.photoUrl != ''
          ? NetworkImage(_associated.photoUrl)
          : PhotoImageProvider().getImageProvider(
              File(_pathNoImage),
            ) as ImageProvider,
      fit: BoxFit.fill);
}
