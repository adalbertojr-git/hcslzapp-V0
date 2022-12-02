import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/controllers/digital.identity.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import '../../common/injection.dart';
import '../../components/degradee.background.dart';
import '../../components/my.appbar.dart';

const String _pathIdentity = 'assets/imgs/logo_carteirad.png';
const String _pathNoImage = 'assets/imgs/noImage.png';
const String _title = 'Carteira Harley Club';

class DigitalIdentityPage extends StatelessWidget {
  final Associated _associated = locator.get<Associated>();
  final DigitalIdentityController _controller = DigitalIdentityController();

  @override
  Widget build(BuildContext context) {
    _controller.init(_associated);
    return Scaffold(
      appBar: MyAppBar(_title),
      body: _widgets(),
    );
  }

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
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.associatedTypeCtrl,
                      label: labelAssociatedType,
                      disabled: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.cnhCtrl,
                      label: labelCNH,
                      disabled: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.cpfCtrl,
                      label: labelCPF,
                      disabled: true,
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
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.dateShieldCtrl,
                      label: labelDateShield,
                      disabled: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.bloodTypeCtrl,
                      label: labelBloodType,
                      disabled: true,
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
