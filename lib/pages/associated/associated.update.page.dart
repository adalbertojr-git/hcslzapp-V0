import 'dart:io';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/injection.dart';
import '../../common/associated.profiles.dart';
import '../../common/labels.and.hints.dart';
import '../../common/photo.image.provider.dart';
import '../../components/button.dart';
import '../../components/centered.message.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../components/my.text.form.field.dart';
import '../../components/progress.dart';
import '../../components/transaction.auth.dialog.dart';
import '../../controllers/associated.update.controller.dart';
import '../../enums/associated.status.dart';
import '../../enums/associated.types.dart';
import '../../enums/blood.types.dart';
import '../../models/associated.dart';
import '../dependent/dependent.add.page.dart';
import '../motorcycle/motorcycle.add.page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

const String _labelNotExists =
    'Dados do associado especificado não foram encontrados.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _pathNoImage = 'assets/imgs/noImage.png';
const String _title = 'Editar Associado';

class AssociatedUpdatePage extends StatefulWidget {
  final String _selectedProfile;
  final int _associatedId;

  AssociatedUpdatePage(this._selectedProfile, this._associatedId);

  @override
  _AssociatedUpdatePageState createState() => _AssociatedUpdatePageState();
}

class _AssociatedUpdatePageState extends State<AssociatedUpdatePage> {
  final AssociatedUpdateController _controller = AssociatedUpdateController();

  @override
  void initState() {
    _controller.getFuture(widget._associatedId).then((value) {
      if (value.isNotEmpty) {
        _controller.setButtonVisibilty();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          appBar: MyAppBar(_title),
          bottomNavigationBar: MyBottomAppBar(),
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
                    return CenteredMessage(
                        title: _title, message: snapshot.error.toString());
                  } else {
                    if (snapshot.data == null)
                      return CenteredMessage(
                        title: _title,
                        message: _controller.errorMsg,
                      );
                    if ((snapshot.data?.length)! > 0) {
                      _controller.associated = (snapshot.data?.first)!;
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
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _controller.isHidedButton
              ? null
              : Button(icon: Icons.save, onClick: () => _update()),
        ),
      );

  _widgets(BuildContext context) => ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.add_photo_alternate,
                  size: 28.0,
                ),
                onPressed: _controller.getImageFromGallery,
              ),
              _photo(),
              IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  size: 25.0,
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Row(
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
                      value: _controller.currentBloodType == ''
                          ? null
                          : _controller.currentBloodType,
                      items: getBloodTypes(),
                      onChanged: _controller.changedBloodTypesDropDownItem,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.cnhCtrl,
                  label: labelCNH,
                  hint: hintCNH,
                  inputType: TextInputType.number,
                ),
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
                    child: widget._selectedProfile == ADMIN
                        ? DropdownButtonFormField(
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
                          )
                        : MyTextFormField(
                            textEditingController:
                                _controller.associatedTypeCtrl,
                            disabled: true,
                          ),
                  ),
                ),
              ],
            ),
          ),
          Row(
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
          widget._selectedProfile == ADMIN
              ? Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 3.0, 2.0, 3.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
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
                )
              : Container(),
          SizedBox(
            height: 30.0,
          ),
        ],
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
      image: _controller.photoPath != ''
          ? PhotoImageProvider().getImageProvider(
              File(_controller.photoPath),
            ) as ImageProvider
          : _controller.photoUrl != ''
              ? NetworkImage(_controller.photoUrl)
              : PhotoImageProvider().getImageProvider(
                  File(_pathNoImage),
                ) as ImageProvider,
      fit: BoxFit.fill);

  _dependentsListWidget() => Column(
        children: [
          const Text(
            'Dependentes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Observer(
            builder: (_) => ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              itemCount: _controller.dependents.length,
              itemBuilder: (_, int i) => Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange[300],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20.0),
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
                          final Future future = Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DependentAddPage(_controller.dependents[i]),
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
              ),
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
                final Future future = Navigator.push(
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
      );

  _motorcyclesListWidget() => Column(
        children: [
          const Text(
            'Motocicletas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Observer(
            builder: (_) => ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              itemCount: _controller.motorcycles.length,
              itemBuilder: (_, int i) => Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange[300],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20.0),
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
                          final Future future = Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MotorcycleAddPage(_controller.motorcycles[i]),
                            ),
                          );
                          future.then(
                            (motorcycle) {
                              if (motorcycle != null) {
                                _controller.motorcycles.removeAt(i);
                                _controller.motorcycles.insert(i, motorcycle);
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
              ),
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
                final Future future = Navigator.push(
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
      );

  _update() async {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert('Corrija os erros informados').show();
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
        _controller.update(_controller.associated).then(
          (value) {
            if (value != null) {
              AsukaSnackbar.success('Associado atualizado com sucesso').show();
              Navigator.of(context).pop(_controller.associated.photoUrl);
              loadAssociatedSingleton(value);
            } else {
              AsukaSnackbar.alert(_controller.errorMsg).show();
            }
          },
        );
      }
    }
  }
}
