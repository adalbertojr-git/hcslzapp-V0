import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/associated.controller.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:hcslzapp/pages/dependent/dependent.add.dart';
import 'package:hcslzapp/pages/motorcycle/motorcycle.add.dart';
import 'package:provider/provider.dart';

class AssociatedUpdate extends StatefulWidget {
  @override
  _AssociatedUpdateState createState() => _AssociatedUpdateState();
}

class _AssociatedUpdateState extends State<AssociatedUpdate> {
  AssociatedController _controller;
  int _associatedId = 2;

  @override
  void initState() {
    _controller = Provider.of<AssociatedController>(context, listen: false);
    _controller.getFuture(_associatedId).then((value) {
      if (value != null && value.isNotEmpty) {
        _controller.hideButton();
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
                    return CenteredMessage(
                      'Oops!!! + ${snapshot.error}.',
                      icon: Icons.error,
                    );
                  } else {
                    if (snapshot.data == null)
                      return CenteredMessage(
                        'Oops!!! ' + _controller.errorMsg,
                        icon: Icons.error,
                      );
                    if (snapshot.data.length > 0) {
                      _controller.associated = snapshot.data.first;
                      _controller.dependents.clear();
                      _controller.motorcycles.clear();
                      _controller
                          .dependentsAddAll(_controller.associated.dependents);
                      _controller.motorcyclesAddAll(
                          _controller.associated.motorcycles);
                      _controller.currentBloodType =
                          _controller.associated.bloodType;
                      return _associatedWidgets(context);
                    } else
                      return CenteredMessage(
                        'Atenção: Associado não encontrado.',
                        icon: Icons.warning,
                        backgroundColor: Colors.yellowAccent,
                        fontColor: Colors.black,
                      );
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                'Oops!!! Um erro desconhecido ocorreu.',
                icon: Icons.error,
              );
            },
          ),
          floatingActionButton: _controller.isHideButton
              ? null
              : Button(Icons.save,
                  onClick: () => _controller.update(_controller.associated)),
        ),
      );

  _associatedWidgets(BuildContext context) => Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.black,
                        size: 33.0,
                      ),
                      onPressed: _controller.getImageFromGallery,
                    ),
                    _photo('assets/imgs/noImage.png'),
                    IconButton(
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      onPressed: _controller.getImageFromCamera,
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                InputTextField(
                  controller: _controller.nameCtrl,
                  controllerText: _controller.associated.name != null
                      ? _controller.associated.name
                      : null,
                  label: labelName,
                  hint: hintName,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                ),
                InputTextField(
                  controller: _controller.emailCtrl,
                  controllerText: _controller.associated.email != null
                      ? _controller.associated.email
                      : null,
                  label: labelEmail,
                  hint: hintEmail,
                  icon: Icons.email,
                  inputType: TextInputType.emailAddress,
                ),
                InputTextField(
                  controller: _controller.phoneCtrl,
                  controllerText: _controller.associated.phone != null
                      ? _controller.associated.phone
                      : null,
                  label: labelPhone,
                  hint: hintPhone,
                  icon: Icons.phone,
                  inputType: TextInputType.phone,
                ),
                InputTextField(
                  controller: _controller.sponsorCtrl,
                  controllerText: _controller.associated.sponsor != null
                      ? _controller.associated.sponsor
                      : null,
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
                            onChanged: _controller.changedDropDownItem,
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
                      child: InputTextField(
                        controller: _controller.cnhCtrl,
                        controllerText: _controller.associated.cnh != null
                            ? _controller.associated.cnh
                            : null,
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
                        controllerText: _controller.associated.cpf != null
                            ? _controller.associated.cpf
                            : null,
                        label: labelCPF,
                        hint: hintCPF,
                        inputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                InputTextField(
                  controller: _controller.associatedTypeCtrl,
                  controllerText: _controller.associated.associatedType != null
                      ? _controller.associated.associatedType
                      : null,
                  label: labelAssociatedType,
                  disabled: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: InputTextField(
                        controller: _controller.dateBirthCtrl,
                        controllerText: _controller.associated.dateBirth != null
                            ? _controller.associated.dateBirth
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
                        controllerText:
                            _controller.associated.dateShield != null
                                ? _controller.associated.dateShield
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
                _dependentsListWidget,
                SizedBox(
                  height: 10.0,
                ),
                _motorcyclesListWidget,
                SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
        ),
      );

  _photo(String fileName) => Container(
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

  get _dependentsListWidget => Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white12,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Text(
              "Dependentes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Observer(
              builder: (_) => ListView.separated(
                shrinkWrap: true,
                itemCount: _controller.dependents.length,
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
                              size: 25.0,
                            ),
                            onTap: () {
                              _controller.dependentRemoveAt(i);
                            },
                          ),
                          GestureDetector(
                            child: Icon(
                              Icons.arrow_forward,
                              size: 25.0,
                            ),
                            onTap: () {
                              final Future<Dependent> future = Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DependentAdd(_controller.dependents[i]),
                                ),
                              );
                              future.then(
                                (dependent) {
                                  if (dependent != null) {
                                    _controller.dependentRemoveAt(i);
                                    _controller.dependentAdd(dependent);
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
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: FloatingActionButton(
                heroTag: "btnDependentes",
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
                    MaterialPageRoute(builder: (context) => DependentAdd(null)),
                  );
                  future.then(
                    (dependent) {
                      if (dependent != null) {
                        _controller.dependentAdd(dependent);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );

  get _motorcyclesListWidget => Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white12,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Text(
              "Motocicletas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Observer(
              builder: (_) => ListView.separated(
                shrinkWrap: true,
                itemCount: _controller.motorcycles.length,
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
                              size: 25.0,
                            ),
                            onTap: () {
                              _controller.motorcycleRemoveAt(i);
                            },
                          ),
                          GestureDetector(
                            child: Icon(
                              Icons.arrow_forward,
                              size: 25.0,
                            ),
                            onTap: () {
                              final Future<Motorcycle> future = Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MotorcycleAdd(_controller.motorcycles[i]),
                                ),
                              );
                              future.then(
                                (motorcycle) {
                                  if (motorcycle != null) {
                                    _controller.motorcycleRemoveAt(i);
                                    _controller.motorcycleAdd(motorcycle);
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
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: FloatingActionButton(
                heroTag: "btnMotocicletas",
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
                        builder: (context) => MotorcycleAdd(null)),
                  );
                  future.then(
                    (motorcycle) {
                      if (motorcycle != null) {
                        _controller.motorcycleAdd(motorcycle);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
}
