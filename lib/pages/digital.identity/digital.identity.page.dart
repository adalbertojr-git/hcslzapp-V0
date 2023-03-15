import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/controllers/digital.identity.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import '../../common/injection.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

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
      bottomNavigationBar: MyBottomAppBar(),
      body: _widgets(),
    );
  }

  _widgets() => ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: _photo(),
          ),
          MyTextFormField(
            textEditingController: _controller.nameCtrl,
            label: labelNameDigitalPayment,
            disabled: true,
          ),

/*          Row(
            children: <Widget>[
*/ /*              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.associatedTypeCtrl,
                  label: labelAssociatedType,
                  disabled: true,
                  textAlign: TextAlign.center,
                ),
              ),*/ /*
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
          ),*/

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
          Column(
            children: [
              Center(
                child: SizedBox(
                  height: 130.0,
                  child: Image.asset(_pathIdentity),
                ),
              ),
              Center(
                child: const Text(
                  'Carteira digital de associado do Harley Club de São Luis - MA',
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  _photo() => Container(
        height: 270.0,
        width: 270.0,
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
