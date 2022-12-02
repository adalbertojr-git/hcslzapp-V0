import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/associated.profiles.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/controllers/payment.add.controller.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Adicionar Mensalidades';

class PaymentAddPage extends StatefulWidget {
  final Payment? _payment;
  final List<String> _years;
  final String _selectedProfile;

  PaymentAddPage(
    this._selectedProfile,
    this._payment,
    this._years,
  );

  @override
  _PaymentAddAddState createState() => _PaymentAddAddState();
}

class _PaymentAddAddState extends State<PaymentAddPage> {
  final PaymentAddController _controller = PaymentAddController();

  @override
  void initState() {
    _controller.payment = widget._payment ?? _controller.payment;
    _controller.init();
    _controller.setYears(widget._years);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(_title),
        bottomNavigationBar: MyBottomAppBar(),
        body: _widgets(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: widget._selectedProfile == ADMIN
            ? Button(
                icon: Icons.save,
                onClick: () => widget._payment == null ? _save() : _update(),
              )
            : SizedBox(),
      );

  _widgets() => Column(
        children: <Widget>[
          Container(
            width: 250,
            child: Observer(
              builder: (_) => MyTextFormField(
                textEditingController: _controller.yearCtrl,
                label: labelYear,
                inputType: TextInputType.number,
                disabled: widget._payment == null ? false : true,
                onChanged: _controller.formController.changeYear,
                errorText: _controller.validateYear(),
                maxLength: 4,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(5.0),
            child: Text('1º Semestre:'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.janCtrl,
                  label: labelJan,
                  inputType: TextInputType.number,
                  disabled: widget._selectedProfile == ADMIN ? false : true,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "###.##"),
                ),
              ),
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.febCtrl,
                  label: labelFeb,
                  inputType: TextInputType.number,
                  disabled: widget._selectedProfile == ADMIN ? false : true,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "###.##"),
                ),
              ),
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.marCtrl,
                  label: labelMar,
                  inputType: TextInputType.number,
                  disabled: widget._selectedProfile == ADMIN ? false : true,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "###.##"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.aprCtrl,
                  label: labelApr,
                  inputType: TextInputType.number,
                  disabled: widget._selectedProfile == ADMIN ? false : true,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "###.##"),
                ),
              ),
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.mayCtrl,
                  label: labelMay,
                  inputType: TextInputType.number,
                  disabled: widget._selectedProfile == ADMIN ? false : true,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "###.##"),
                ),
              ),
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.junCtrl,
                  label: labelJun,
                  inputType: TextInputType.number,
                  disabled: widget._selectedProfile == ADMIN ? false : true,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "###.##"),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(5.0),
            child: Text('2º Semestre:'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.julCtrl,
                  label: labelJul,
                  inputType: TextInputType.number,
                  disabled: widget._selectedProfile == ADMIN ? false : true,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "###.##"),
                ),
              ),
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.augCtrl,
                  label: labelAug,
                  inputType: TextInputType.number,
                  disabled: widget._selectedProfile == ADMIN ? false : true,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "###.##"),
                ),
              ),
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.sepCtrl,
                  label: labelSep,
                  inputType: TextInputType.number,
                  disabled: widget._selectedProfile == ADMIN ? false : true,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "###.##"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.octCtrl,
                  label: labelOct,
                  inputType: TextInputType.number,
                  disabled: widget._selectedProfile == ADMIN ? false : true,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "###.##"),
                ),
              ),
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.novCtrl,
                  label: labelNov,
                  inputType: TextInputType.number,
                  disabled: widget._selectedProfile == ADMIN ? false : true,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "###.##"),
                ),
              ),
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.decCtrl,
                  label: labelDec,
                  inputType: TextInputType.number,
                  disabled: widget._selectedProfile == ADMIN ? false : true,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "###.##"),
                ),
              ),
            ],
          ),
        ],
      );

  _save() {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert('Preencha os campos ogrigatórios').show();
    } else {
      _controller.save().then(
        (payment) {
          if (payment != null) {
            AsukaSnackbar.success('Mensalidades cadastradas com sucesso')
                .show();
            Navigator.of(context).pop(payment);
          } else {
            AsukaSnackbar.alert(_controller.errorMsg).show();
          }
        },
      );
    }
  }

  _update() {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert('Preencha os campos ogrigatórios').show();
    } else {
      _controller.update().then(
        (payment) {
          if (payment != null) {
            AsukaSnackbar.success('Mensalidades atualizadas com sucesso')
                .show();
            Navigator.of(context).pop(payment);
          } else {
            AsukaSnackbar.alert(_controller.errorMsg).show();
          }
        },
      );
    }
  }
}
