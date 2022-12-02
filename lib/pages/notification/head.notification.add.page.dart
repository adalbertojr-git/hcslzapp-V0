import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/controllers/head.notification.add.controller.dart';
import 'package:hcslzapp/models/head.notification.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Avisos da Diretoria';

class HeadNotificationAddPage extends StatelessWidget {
  final HeadNotification? _headNotification;
  final HeadNotificationAddController _controller =
      HeadNotificationAddController();

  HeadNotificationAddPage(this._headNotification);

  @override
  Widget build(BuildContext context) {
    _controller.headNotification =
        _headNotification ?? _controller.headNotification;
    _controller.init();
    return Scaffold(
      appBar: MyAppBar(
        _headNotification == null ? 'Adicionar ' + _title : 'Editar ' + _title,
      ),
      bottomNavigationBar: MyBottomAppBar(),
      body: ListView(
        children: <Widget>[
          Observer(
            builder: (_) {
              return MyTextFormField(
                textEditingController: _controller.titleCtrl,
                label: labelNotificationTitle,
                hint: hintNotificationTitle,
                icon: Icons.title,
                inputType: TextInputType.text,
                onChanged: _controller.formController.changeTitle,
                errorText: _controller.validateTitle(),
              );
            },
          ),
          Observer(
            builder: (_) {
              return MyTextFormField(
                textEditingController: _controller.notificationCtrl,
                label: labelNotification,
                hint: hintNotification,
                icon: Icons.message,
                inputType: TextInputType.text,
                nLines: 5,
                onChanged: _controller.formController.changeNotification,
                errorText: _controller.validateNotification(),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Button(
        icon: Icons.save,
        onClick: () =>
            _headNotification == null ? _save(context) : _update(context),
      ),
    );
  }

  _save(BuildContext context) {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert('Corrija os erros informados').show();
    } else {
      _controller.save().then(
        (value) {
          if (value != null) {
            AsukaSnackbar.success('Aviso cadastrado com sucesso').show();
            Navigator.of(context).pop(value);
          } else {
            AsukaSnackbar.alert(_controller.errorMsg).show();
          }
        },
      );
    }
  }

  _update(BuildContext context) {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert('Corrija os erros informados').show();
    } else {
      _controller.update().then(
        (value) {
          if (value != null) {
            AsukaSnackbar.success('Aviso atualizado com sucesso').show();
            Navigator.of(context).pop(value);
          } else {
            AsukaSnackbar.alert(_controller.errorMsg).show();
          }
        },
      );
    }
  }
}
