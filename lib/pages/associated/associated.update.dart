import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/associated.controller.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:hcslzapp/pages/dependent/dependent.add.dart';
import 'package:hcslzapp/pages/motorcycle/motorcycle.add.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AssociatedUpdate extends StatefulWidget {

  @override
  _AssociatedUpdateState createState() => _AssociatedUpdateState();
}

class _AssociatedUpdateState extends State<AssociatedUpdate> {
  List<DropdownMenuItem<String>> _dropDownBloodTypes;
  File _image;
  final picker = ImagePicker();
  AssociatedController _controller;
  Future<List<Associated>> _future;
  int _associatedId = 1;

  @override
  void initState() {
    _controller = Provider.of<AssociatedController>(context, listen: false);

    _getFuture().then((value) {
      if (value != null && value.isNotEmpty) {
        _controller.hideButton();
      }
    });

    _dropDownBloodTypes = getBloodTypes();
    super.initState();
  }

  Future<List<Associated>> _getFuture() =>
      _future = _controller.fetchAssociated(_associatedId);

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        setState(() {
          //photo(_image.path.toString());
        });
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build Associated");
    return Observer(
      builder: (_) => Scaffold(
        body: FutureBuilder<List<Associated>>(
          future: _future,
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
                    'Oops!!! + ${snapshot.error}.',
                    icon: Icons.error,
                  );
                } else {
                  if (snapshot.data != null) {
                    final List<Associated> associatedList = snapshot.data;
                    if (associatedList.isNotEmpty)
                      return _associatedWidgets(context, associatedList);
                    else
                      return CenteredMessage(
                        'Atenção: Associado nao encontrado.',
                        icon: Icons.warning,
                      );
                  } else
                    return CenteredMessage(
                      'Oops!!! ' + _controller.errorMsg,
                      icon: Icons.error,
                    );
                } //else
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              'Oops!!! Um erro desconhecido ocorreu.',
              icon: Icons.error,
            );
          },
        ),
        floatingActionButton: _controller.isHideButton
            ? null
            : Button(
                Icons.save,
                onClick: () {
                  _update(context);
                },
              ),
      ),
    );
  }

  Container _associatedWidgets(
      BuildContext context, List<Associated> associatedList) {
    final Associated associated = associatedList[0];
    _controller.currentBloodType = associated.bloodType;
    return Container(
      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white30, Colors.deepOrange],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TopMargin(),
              _photo('assets/imgs/noImage.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add_photo_alternate,
                      color: Colors.black,
                      size: 33.0,
                    ),
                    onPressed: getImageFromGallery,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onPressed: getImageFromCamera,
                  )
                ],
              ),
              InputTextField(
                controller: _controller.nameCtrl,
                controllerText:
                    associated.name != null ? associated.name : null,
                label: labelName,
                hint: hintName,
                icon: Icons.person,
                inputType: TextInputType.text,
              ),
              InputTextField(
                controller: _controller.emailCtrl,
                controllerText:
                    associated.email != null ? associated.email : null,
                label: labelEmail,
                hint: hintEmail,
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
              ),
              InputTextField(
                controller: _controller.phoneCtrl,
                controllerText:
                    associated.phone != null ? associated.phone : null,
                label: labelPhone,
                hint: hintPhone,
                icon: Icons.phone,
                inputType: TextInputType.phone,
              ),
              InputTextField(
                controller: _controller.sponsorCtrl,
                controllerText:
                    associated.sponsor != null ? associated.sponsor : null,
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
                      child: Text(
                        'Tipo Sanguineo:',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Observer(
                        builder: (_) {
                          return Container(
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
                              items: _dropDownBloodTypes,
                              onChanged: _controller.changedDropDownItem,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              InputTextField(
                controller: _controller.associatedTypeCtrl,
                controllerText: associated.associatedType != null
                    ? associated.associatedType
                    : null,
                label: labelAssociatedType,
                disabled: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InputTextField(
                      controller: _controller.cnhCtrl,
                      controllerText:
                          associated.cnh != null ? associated.cnh : null,
                      label: labelCNH,
                      hint: hintCNH,
                      inputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: InputTextField(
                      controller: _controller.cpfCtrl,
                      controllerText:
                          associated.cpf != null ? associated.cpf : null,
                      label: labelCPF,
                      hint: hintCPF,
                      inputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InputTextField(
                      controller: _controller.dateBirthCtrl,
                      controllerText: associated.dateBirth != null
                          ? associated.dateBirth
                          : null,
                      label: labelDateBirth,
                      hint: hintDate,
                      icon: Icons.calendar_today,
                      inputType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: InputTextField(
                      controller: _controller.dateShieldCtrl,
                      controllerText: associated.dateShield != null
                          ? associated.dateShield
                          : null,
                      label: labelDateShield,
                      hint: hintDate,
                      icon: Icons.calendar_today,
                      inputType: TextInputType.datetime,
                    ),
                  ),
                ],
              ),
              Divider(),
              _dependentsAndMotorcyclesListWidget(
                'Dependentes',
              ),
              SizedBox(
                height: 10.0,
              ),
              _dependentsAndMotorcyclesListWidget(
                'Motocicletas',
              ),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _photo(String fileName) {
    return Container(
      height: 200.0,
      width: 200.0,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100.0),
          image: DecorationImage(
            image: AssetImage(fileName),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Container _dependentsAndMotorcyclesListWidget(String _listTitle) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white12,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(
            _listTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Observer(
            builder: (_) => ListView.separated(
              shrinkWrap: true,
              itemCount: _listTitle == "Dependentes"
                  ? _controller.dependents.length
                  : _controller.motorcycles.length,
              itemBuilder: (BuildContext context, int i) {
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
                        child: _listTitle == "Dependentes"
                            ? Icon(Icons.person)
                            : Icon(Icons.motorcycle),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    title: _listTitle == "Dependentes"
                        ? Text(_controller.dependents[i].name)
                        : Text(_controller.motorcycles[i].model),
                    subtitle: _listTitle == "Dependentes"
                        ? Text(_controller.dependents[i].email)
                        : Text(_controller.motorcycles[i].year),
                    onTap: () {
                      final Future<Dependent> future = Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return _listTitle == "Dependentes"
                                ? DependentAdd(_controller.dependents[i])
                                : MotorcycleAdd();
                          },
                        ),
                      );
                      if (_listTitle == "Dependentes") {
                        future.then(
                          (dependent) {
                            if (dependent != null) {
                              _add(dependent);
                            }
                          },
                        );
                      }
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: FloatingActionButton(
              heroTag: _listTitle,
              mini: true,
              backgroundColor: Colors.deepOrangeAccent[100],
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                final Future<Dependent> future = Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return _listTitle == "Dependentes"
                          ? DependentAdd(null)
                          : MotorcycleAdd();
                    },
                  ),
                );
                if (_listTitle == "Dependentes") {
                  future.then(
                    (dependent) {
                      if (dependent != null) {
                        _add(dependent);
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _add(Dependent dependent) {
    print('Recebido: $dependent');
    _controller.dependentsAdd(dependent);
  }

  _update(BuildContext context) {}
}
