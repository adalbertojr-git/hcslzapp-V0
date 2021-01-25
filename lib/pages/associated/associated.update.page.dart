import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/associated.controller.dart';
import 'package:hcslzapp/enums/associated.types.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:hcslzapp/pages/dependent/dependent.add.page.dart';
import 'package:hcslzapp/pages/motorcycle/motorcycle.add.page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'dart:io';

class AssociatedUpdate extends StatefulWidget {
  final int associatedId;

  AssociatedUpdate(this.associatedId);

  @override
  _AssociatedUpdateState createState() => _AssociatedUpdateState();
}

class _AssociatedUpdateState extends State<AssociatedUpdate> {
  AssociatedController _controller = AssociatedController();

  @override
  void initState() {
    //_controller = Provider.of<AssociatedController>(context, listen: false);
    _controller.getFuture(widget.associatedId).then((value) {
      if (value != null && value.isNotEmpty) {
        _controller.hideButton();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    //if (!_controller.isHideButton) _controller.hideButton();
    super.dispose();
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
                    return CenteredMessage(snapshot.error.toString());
                  } else {
                    if (snapshot.data == null)
                      return CenteredMessage(
                        _controller.errorMsg,
                      );
                    if (snapshot.data.length > 0) {
                      _controller.associated = snapshot.data.first;
                      _controller.init;
                      return _associatedWidgets(context);
                    } else
                      return CenteredMessage(
                        'Dados do associado especificado não foram encontrados.',
                      );
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                'Houve um erro desconhecido ao executar a transação.',
              );
            },
          ),
          floatingActionButton: _controller.isHideButton
              ? null
              : Button(icon: Icons.save, onClick: () => _update),
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
                  _photo,
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
              Observer(
                builder: (_) {
                  return InputTextField(
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
                  return InputTextField(
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
              InputTextField(
                textEditingController: _controller.phoneCtrl,
                label: labelPhone,
                hint: hintPhone,
                icon: Icons.phone,
                inputType: TextInputType.phone,
                maskTextInputFormatter:
                    MaskTextInputFormatter(mask: "(##) #####-####"),
              ),
              InputTextField(
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
                    child: InputTextField(
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
                    child: InputTextField(
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
                      child: Text(
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
                    child: InputTextField(
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
                    child: InputTextField(
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
      );

  get _photo => Container(
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
              color: Colors.black,
              borderRadius: BorderRadius.circular(150.0),
              image: DecorationImage(
                image: _getImageProvider(File(_controller.filePath)),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      );

  ImageProvider _getImageProvider(File f) => f.existsSync()
      ? FileImage(f)
      : const AssetImage('assets/imgs/noImage.png');

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
                              size: 25.0,
                            ),
                            onTap: () {
                              _controller.dependents.removeAt(i);
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
                                    _controller.dependents.removeAt(i);
                                    _controller.dependents.add(dependent);
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
                              size: 25.0,
                            ),
                            onTap: () {
                              _controller.motorcycles.removeAt(i);
                              ;
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
                                    _controller.motorcycles.removeAt(i);
                                    _controller.motorcycles.add(motorcycle);
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

  get _update {
    if (_controller.hasErrors) {
      asuka.showSnackBar(
        SnackBar(
          content: Text('Atenção: Existem erros no formulário que devem '
              'ser corrigidos antes de efetivar a transação.'),
        ),
      );
    } else {
      _controller.update(_controller.associated).then(
        (value) {
          if (value != null) {
            asuka.showSnackBar(
              SnackBar(
                content: Text('Associado atualizado com sucesso.'),
              ),
            );
            Navigator.of(context).pop();
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
