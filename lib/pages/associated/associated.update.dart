import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hcslzapp/blocs/associated.bloc.dart';
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

const _labelName = 'Nome *';
const _labelPhone = 'Telefone *';
const _labelEmail = 'Email *';
const _labelSponsor = 'Padrinho';
const _labelAssociatedType = 'Tipo de Associado';
const _labelCNH = 'CNH';
const _labelCPF = 'CPF';
const _labelDateBirth = 'Data Nascimento';
const _labelDateShield = 'Data Escudamento';
const _tipDate = 'dd/mm/yyyy';

class AssociatedUpdate extends StatefulWidget {
  @override
  _AssociatedUpdateState createState() => _AssociatedUpdateState();
}

class _AssociatedUpdateState extends State<AssociatedUpdate> {
  //List _bloodTypes = List();
  List<DropdownMenuItem<String>> _dropDownBloodTypes;
  String _currentBloodType;
  bool _hideButton = true;
  File _image;
  final picker = ImagePicker();
  int _associatedCode = 1;

  @override
  void initState() {
    Provider.of<AssociatedBloc>(context, listen: false)
        .findByCode(_associatedCode)
        .then((value) {
      if (value != null && value.isNotEmpty) {
        setState(() {
          _hideButton = false;
        });
      }
    });
    _dropDownBloodTypes = getBloodTypes();
    super.initState();
  }

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
    AssociatedBloc _associatedBloc = Provider.of<AssociatedBloc>(context);
    return Scaffold(
      body: FutureBuilder<List<Associated>>(
        future: _associatedBloc.findByCode(_associatedCode),
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
                  'Erro: ${snapshot.error}.',
                  icon: Icons.error,
                );
              } else {
                if (snapshot.data == null) {
                  return CenteredMessage(
                    'Erro na requisiçao dos dados.',
                    icon: Icons.error,
                  );
                }
                final List<Associated> associatedList = snapshot.data;
                if (associatedList.isNotEmpty) {
                  return _associatedWidgets(
                      _associatedBloc, context, associatedList);
                } //if (associatedList.isNotEmpty)
                return CenteredMessage(
                  'Associado nao encontrado.',
                  icon: Icons.warning,
                );
              } //else
          } //switch (snapshot.connectionState)
          return CenteredMessage(
            'Erro desconhecido.',
            icon: Icons.error,
          );
        },
      ),
      floatingActionButton: _hideButton
          ? null
          : Button(
              Icons.save,
              onClick: () {
                _save(context);
              },
            ),
    );
  }

  Container _associatedWidgets(AssociatedBloc associatedBloc,
      BuildContext context, List<Associated> associatedList) {
    final Associated associated = associatedList[0];
    _currentBloodType = associated.bloodType;
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
              SizedBox(
                height: 30.0,
                width: double.infinity,
              ),
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
                    width: 50.0,
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
                controller: associatedBloc.nameCtrl,
                label: _labelName,
                icon: Icons.person,
                inputType: TextInputType.text,
                valor: associated.name,
              ),
              InputTextField(
                controller: associatedBloc.emailCtrl,
                label: _labelEmail,
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
                valor: associated.email,
              ),
              InputTextField(
                controller: associatedBloc.phoneCtrl,
                label: _labelPhone,
                icon: Icons.phone,
                inputType: TextInputType.phone,
                valor: associated.phone,
              ),
              InputTextField(
                controller: associatedBloc.sponsorCtrl,
                label: _labelSponsor,
                icon: Icons.person_pin,
                valor:
                    associated.sponsor == null ? null : associated.sponsor.name,
                inputType: TextInputType.text,
              ),
              InputTextField(
                controller: associatedBloc.associatedTypeCtrl,
                label: _labelAssociatedType,
                valor: associated.associatedType,
                disabled: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InputTextField(
                      controller: associatedBloc.cnhCtrl,
                      label: _labelCNH,
                      inputType: TextInputType.number,
                      valor: associated.cnh,
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      controller: associatedBloc.cpfCtrl,
                      label: _labelCPF,
                      inputType: TextInputType.number,
                      valor: associated.cpf,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InputTextField(
                      controller: associatedBloc.dateBirthCtrl,
                      label: _labelDateBirth,
                      icon: Icons.calendar_today,
                      tip: _tipDate,
                      inputType: TextInputType.datetime,
                      valor: associated.dateBirth,
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      controller: associatedBloc.dateShieldCtrl,
                      label: _labelDateShield,
                      icon: Icons.calendar_today,
                      tip: _tipDate,
                      inputType: TextInputType.datetime,
                      valor: associated.dateShield,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Tipo Sanguineo:',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 58.0,
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        value: _currentBloodType,
                        items: _dropDownBloodTypes,
                        onChanged: _changedDropDownItem,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              _dependentsAndMotorcyclesListWidget(
                'Dependentes',
                dependents: associated.dependents,
              ),
              SizedBox(
                height: 10.0,
              ),
              _dependentsAndMotorcyclesListWidget(
                'Motocicletas',
                motorcycles: associated.motorcycles,
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

  Container _dependentsAndMotorcyclesListWidget(String title,
      {List<Dependent> dependents, List<Motorcycle> motorcycles}) {
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
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount:
                dependents != null ? dependents.length : motorcycles.length,
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
                      child: dependents != null
                          ? Icon(Icons.person)
                          : Icon(Icons.motorcycle),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  title: dependents != null
                      ? Text(dependents[i].name)
                      : Text(motorcycles[i].model),
                  subtitle: dependents != null
                      ? Text(dependents[i].email)
                      : Text(motorcycles[i].year),
                  onTap: () {
                    final Future<Dependent> future = Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return dependents != null
                              ? DependentAdd(dependents[i])
                              : MotorcycleAdd();
                        },
                      ),
                    );
                    if (dependents != null) {
                      future.then(
                        (dependenteRecebido) {
                          _add(dependents, dependenteRecebido);
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
          Container(
            padding: EdgeInsets.only(top: 20.0),
            //alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: title,
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
                      return dependents != null
                          ? DependentAdd(null)
                          : MotorcycleAdd();
                    },
                  ),
                );
                if (dependents != null) {
                  future.then(
                    (dependenteRecebido) {
                      _add(dependents, dependenteRecebido);
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

  void _add(List<Dependent> dependents, Dependent dependenteRecebido) {
    if (dependenteRecebido != null) {
      setState(
        () {
          dependents.add(dependenteRecebido);
        },
      );
    }
  }
  
  void _changedDropDownItem(String selected) {
    setState(() {
      _currentBloodType = selected;
    });
  }

  void _save(BuildContext context) {}
}
