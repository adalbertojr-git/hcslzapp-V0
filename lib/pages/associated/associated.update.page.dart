import 'dart:io';

import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/associated.update.controller.dart';
import 'package:hcslzapp/enums/associated.status.dart';
import 'package:hcslzapp/enums/associated.types.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:hcslzapp/pages/dependent/dependent.add.page.dart';
import 'package:hcslzapp/pages/motorcycle/motorcycle.add.page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

const String _labelNotExists =
    'Dados do associado especificado não foram encontrados.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _pathNoImage = 'assets/imgs/noImage.png';
const String _title = 'Associado';

class AssociatedUpdatePage extends StatefulWidget {
  final int _associatedId;

  AssociatedUpdatePage(this._associatedId);

  @override
  _AssociatedUpdatePageState createState() => _AssociatedUpdatePageState();
}

class _AssociatedUpdatePageState extends State<AssociatedUpdatePage> {
  AssociatedUpdateController _controller = AssociatedUpdateController();

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
          body: FutureBuilder<List<Associated>>(
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
                    return CenteredMessage(title: _title,
                        message: snapshot.error.toString());
                  } else {
                    if (snapshot.data == null)
                      return CenteredMessage(
                        title: _title,
                        message: _controller.errorMsg,
                      );
                    if (snapshot.data.length > 0) {
                      _controller.associated = snapshot.data.first;
                      _controller.init();
                      return _widgets(context);
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: _controller.isHidedButton
              ? null
              : Button(icon: Icons.save, onClick: () => _update()),
        ),
      );

  _widgets(BuildContext context) => Container(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
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
              TopBar(title: 'Associado'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add_photo_alternate,
                      color: Colors.black,
                      size: 43.0,
                    ),
                    onPressed: _controller.getImageFromGallery,
                  ),
                  _photo(),
                  IconButton(
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.black,
                      size: 40.0,
                    ),
                    onPressed: _controller.getImageFromCamera,
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Observer(
                builder: (_) {
                  return MyTextFormField(
                    textEditingController: _controller.nameCtrl,
                    label: labelName,
                    hint: hintName,
                    icon: Icons.person,
                    inputType: TextInputType.text,
                    onChanged: _controller.formController.changeName,
                    errorText: _controller.validateName(),
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return MyTextFormField(
                    textEditingController: _controller.emailCtrl,
                    label: labelEmail,
                    hint: hintEmail,
                    icon: Icons.email,
                    inputType: TextInputType.emailAddress,
                    onChanged: _controller.formController.changeEmail,
                    errorText: _controller.validateEmail(),
                  );
                },
              ),
              MyTextFormField(
                textEditingController: _controller.phoneCtrl,
                label: labelPhone,
                hint: hintPhone,
                icon: Icons.phone,
                inputType: TextInputType.phone,
                maskTextInputFormatter:
                    MaskTextInputFormatter(mask: "(##) #####-####"),
              ),
              MyTextFormField(
                textEditingController: _controller.sponsorCtrl,
                label: labelSponsor,
                hint: hintSponsor,
                icon: Icons.person_pin,
                inputType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 3.0, 2.0, 3.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Expanded(
                      child: const Text(
                        'Tipo Sanguíneo:',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 55.0,
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          value: _controller.currentBloodType,
                          items: getBloodTypes(),
                          onChanged: _controller.changedBloodTypesDropDownItem,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.cnhCtrl,
                      label: labelCNH,
                      hint: hintCNH,
                      inputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.cpfCtrl,
                      label: labelCPF,
                      hint: hintCPF,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.###.###-##"),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 3.0, 2.0, 3.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Expanded(
                      child: const Text(
                        'Tipo de Associado:',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 55.0,
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          value: _controller.currentAssociatedType,
                          items: getAssociatedTypes(),
                          onChanged:
                              _controller.changedAssociatedTypesDropDownItem,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.dateBirthCtrl,
                      label: labelDateBirth,
                      hint: hintDate,
                      icon: Icons.calendar_today,
                      inputType: TextInputType.datetime,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "##/##/####"),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.dateShieldCtrl,
                      label: labelDateShield,
                      hint: hintDate,
                      icon: Icons.calendar_today,
                      inputType: TextInputType.datetime,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "##/##/####"),
                    ),
                  ),
                ],
              ),
              Divider(),
              _dependentsListWidget(),
              SizedBox(
                height: 10.0,
              ),
              _motorcyclesListWidget(),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 3.0, 2.0, 3.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Expanded(
                        child: const Text(
                          'Status:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 55.0,
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            value: _controller.currentStatus,
                            items: getStatus(),
                            onChanged: _controller.changedStatusDropDownItem,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      );

  _photo() => Container(
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
              color: Colors.white,
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
          : _controller.photoUrl != null
              ? NetworkImage(_controller.photoUrl)
              : PhotoImageProvider().getImageProvider(
                  File(_pathNoImage),
                ),
      fit: BoxFit.fill);

  _dependentsListWidget() => Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white12,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            const Text(
              'Dependentes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Observer(
              builder: (_) => ListView.separated(
                shrinkWrap: true,
                itemCount: _controller.dependents.length,
                itemBuilder: (_, int i) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 5.0),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 48,
                        height: 48,
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          child: Icon(Icons.person),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      trailing: Wrap(
                        spacing: 10, // space between two icons
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(
                              Icons.delete,
                            ),
                            onTap: () {
                              _controller.dependents.removeAt(i);
                            },
                          ),
                          GestureDetector(
                            child: Icon(
                              Icons.arrow_forward,
                            ),
                            onTap: () {
                              final Future<Dependent> future = Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DependentAddPage(
                                      _controller.dependents[i]),
                                ),
                              );
                              future.then(
                                (dependent) {
                                  if (dependent != null) {
                                    _controller.dependents.removeAt(i);
                                    _controller.dependents.insert(i, dependent);
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      title: Text(_controller.dependents[i].name),
                      subtitle: Text(_controller.dependents[i].email),
                    ),
                  );
                },
                separatorBuilder: (_, int index) => const Divider(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: FloatingActionButton(
                heroTag: 'btnDependentes',
                mini: true,
                backgroundColor: Colors.deepOrangeAccent[100],
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  final Future<Dependent> future = Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DependentAddPage(null)),
                  );
                  future.then(
                    (dependent) {
                      if (dependent != null) {
                        _controller.dependents.add(dependent);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );

  _motorcyclesListWidget() => Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white12,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            const Text(
              'Motocicletas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Observer(
              builder: (_) => ListView.separated(
                shrinkWrap: true,
                itemCount: _controller.motorcycles.length,
                itemBuilder: (_, int i) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 5.0),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 48,
                        height: 48,
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          child: Icon(Icons.motorcycle),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      trailing: Wrap(
                        spacing: 10, // space between two icons
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(
                              Icons.delete,
                            ),
                            onTap: () {
                              _controller.motorcycles.removeAt(i);
                            },
                          ),
                          GestureDetector(
                            child: Icon(
                              Icons.arrow_forward,
                            ),
                            onTap: () {
                              final Future<Motorcycle> future = Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MotorcycleAddPage(
                                      _controller.motorcycles[i]),
                                ),
                              );
                              future.then(
                                (motorcycle) {
                                  if (motorcycle != null) {
                                    _controller.motorcycles.removeAt(i);
                                    _controller.motorcycles
                                        .insert(i, motorcycle);
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      title: Text(_controller.motorcycles[i].model),
                      subtitle: Text(_controller.motorcycles[i].year),
                    ),
                  );
                },
                separatorBuilder: (_, int index) => const Divider(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: FloatingActionButton(
                heroTag: 'btnMotocicletas',
                mini: true,
                backgroundColor: Colors.deepOrangeAccent[100],
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {
                  final Future<Motorcycle> future = Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MotorcycleAddPage(null)),
                  );
                  future.then(
                    (motorcycle) {
                      if (motorcycle != null) {
                        _controller.motorcycles.add(motorcycle);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );

  _update() async {
    if (_controller.hasErrors) {
      asuka.showSnackBar(
        SnackBar(
          content: const Text('Atenção: Existem erros no formulário que devem '
              'ser corrigidos antes de efetivar a transação.'),
        ),
      );
    } else {
      var response = true;
      if (_controller.currentStatus == 'Inativo') {
        response = await showDialog(
            context: context,
            builder: (context) {
              return TransactionAuthDialog(
                  msg:
                      'Inativar o associado acarreta perda de acesso ao App. ' +
                          '\n\n' +
                          'Confirma?');
            });
      }
      if (response == true) {
        asuka.showSnackBar(
          SnackBar(
            content: const Text('Aguarde...'),
          ),
        );
        _controller.update(_controller.associated).then(
          (value) {
            if (value != null) {
              asuka.hideCurrentSnackBar();
              asuka.showSnackBar(
                SnackBar(
                  content: const Text('Associado atualizado com sucesso.'),
                ),
              );
              Navigator.of(context).pop(_controller.associated.photoUrl);
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
}
