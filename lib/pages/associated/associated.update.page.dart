import 'dart:io';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/injection.dart';
import '../../common/associated.profiles.dart';
import '../../common/labels.and.hints.dart';
import '../../common/messages.dart';
import '../../common/photo.image.provider.dart';
import '../../components/button.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../components/my.text.form.field.dart';
import '../../components/transaction.auth.dialog.dart';
import '../../controllers/associated.update.controller.dart';
import '../../enums/associated.status.dart';
import '../../enums/associated.types.dart';
import '../../enums/blood.types.dart';
import '../../models/associated.dart';
import '../dependent/dependent.add.page.dart';
import '../motorcycle/motorcycle.add.page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

const String _pathNoImage = 'assets/imgs/noImage.png';
const String _title = 'Editar Associado';

// ignore: must_be_immutable
class AssociatedUpdatePage extends StatelessWidget {
  final String _selectedProfile;
  late Associated? _associated;
  final AssociatedUpdateController _controller = AssociatedUpdateController();

  AssociatedUpdatePage(this._selectedProfile, this._associated);

  @override
  Widget build(BuildContext context) {
    _controller.associated = (this._associated == null
        ? locator.get<Associated>()
        : this._associated)!;
    _controller.init();
    return Scaffold(
      appBar: MyAppBar(_title),
      bottomNavigationBar: MyBottomAppBar(),
      body: _widgets(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Button(
        icon: Icons.save,
        onClick: () => _update(context),
      ),
    );
  }

  _widgets(BuildContext context) => ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _selectedProfile == ASSOCIATED
                  ? IconButton(
                      icon: Icon(
                        Icons.add_photo_alternate,
                        size: 28.0,
                      ),
                      onPressed: _controller.getImageFromGallery,
                    )
                  : Container(),
              _photo(),
              _selectedProfile == ASSOCIATED
                  ? IconButton(
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 25.0,
                      ),
                      onPressed: _controller.getImageFromCamera,
                    )
                  : Container(),
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
                isPassword: _selectedProfile == ASSOCIATED ? false : true,
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
            isPassword: _selectedProfile == ASSOCIATED ? false : true,
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
                  isPassword: _selectedProfile == ASSOCIATED ? false : true,
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
                  isPassword: _selectedProfile == ASSOCIATED ? false : true,
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
                    child: _selectedProfile == ADMIN
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
                child: Observer(builder: (_) {
                  return MyTextFormField(
                    textEditingController: _controller.dateBirthCtrl,
                    label: labelDateBirth,
                    hint: hintDate,
                    icon: Icons.calendar_today,
                    inputType: TextInputType.datetime,
                    disabled: true,
                    isPassword: true,
                    onTap: _selectedProfile == ASSOCIATED ? () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1923),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );
                      if (pickedDate != null) {
                        _controller.dateBirthCtrl.text =
                            _controller.formatDate(pickedDate);
                      }
                    } : null,
                  );
                }),
              ),
              Expanded(
                child: Observer(builder: (_) {
                  return MyTextFormField(
                    textEditingController: _controller.dateShieldCtrl,
                    label: labelDateShield,
                    hint: hintDate,
                    icon: Icons.calendar_today,
                    inputType: TextInputType.datetime,
                    disabled: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2012),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );
                      if (pickedDate != null) {
                        _controller.dateShieldCtrl.text =
                            _controller.formatDate(pickedDate);
                      }
                    },
                  );
                }),
              ),
            ],
          ),
          Divider(),
          _dependentsListWidget(context),
          SizedBox(
            height: 10.0,
          ),
          _motorcyclesListWidget(context),
          SizedBox(
            height: 10.0,
          ),
          _selectedProfile == ADMIN
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
            height: 50.0,
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

  _dependentsListWidget(BuildContext context) => Column(
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

  _motorcyclesListWidget(BuildContext context) => Column(
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

  _update(BuildContext context) async {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
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
        try {
          AsukaSnackbar.message(WAIT).show();
          final value = await _controller.update(_controller.associated);
          if (_controller.associated == locator.get<Associated>()) {
            loadAssociatedSingleton(value);
          }
          AsukaSnackbar.success(SUCCESS).show();
          Navigator.of(context).pop(_controller.associated.photoUrl);
        } on HttpException catch (e) {
          AsukaSnackbar.alert(e.message.toString()).show();
        } catch (e) {
          AsukaSnackbar.alert(e.toString()).show();
        } finally {}
      }
    }
  }
}
