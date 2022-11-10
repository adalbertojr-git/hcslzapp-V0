import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/head.notification.add.controller.dart';
import 'package:hcslzapp/models/head.notification.dart';
import 'package:asuka/asuka.dart' as asuka;

const String _title = 'Avisos da Diretoria';

class HeadNotificationAddPage extends StatefulWidget {
  final HeadNotification? _headNotification;

  HeadNotificationAddPage(this._headNotification);

  @override
  _HeadNotificationAddPageState createState() =>
      _HeadNotificationAddPageState();
}

class _HeadNotificationAddPageState extends State<HeadNotificationAddPage> {
  HeadNotificationAddController _controller = HeadNotificationAddController();

  @override
  void initState() {
    _controller.headNotification =
        widget._headNotification ?? _controller.headNotification;
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
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
              TopBar(
                title: widget._headNotification == null
                    ? 'Adicionar ' + _title
                    : 'Editar ' + _title,
              ),
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
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Button(
          icon: Icons.save,
          onClick: () =>
              widget._headNotification == null ? _save() : _update()),
    );
  }

  _save() {
    if (_controller.hasErrors) {
      asuka.showSnackBar(
        SnackBar(
          content: const Text('Atenção: Existem erros no formulário que devem '
              'ser corrigidos antes de efetivar a transação.'),
        ),
      );
    } else {
      _controller.save().then(
        (value) {
          if (value != null) {
            asuka.showSnackBar(
              SnackBar(
                content: const Text('Aviso cadastrado com sucesso.'),
              ),
            );
            Navigator.of(context).pop(value);
          } else {
            asuka.showSnackBar(
              SnackBar(
                content: Text(_controller.errorMsg),
              ),
            );
          }
        },
      );
    }
  }

  _update() {
    if (_controller.hasErrors) {
      asuka.showSnackBar(
        SnackBar(
          content: const Text('Atenção: Existem erros no formulário que devem '
              'ser corrigidos antes de efetivar a transação.'),
        ),
      );
    } else {
      _controller.update().then(
        (value) {
          if (value != null) {
            asuka.showSnackBar(
              SnackBar(
                content: const Text('Aviso atualizado com sucesso.'),
              ),
            );
            Navigator.of(context).pop(value);
          } else {
            asuka.showSnackBar(
              SnackBar(
                content: Text(_controller.errorMsg),
              ),
            );
          }
        },
      );
    }
  }
}
