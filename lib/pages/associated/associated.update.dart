/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que permite ao associado logado atualizar seus dados cadastrais

OBS: o padrinho, o tipo de membro e a data de escudamento sao definidas pela
administracao do App e nao podem ser alteradas pelo associado

*/
import 'package:flutter/material.dart';
import 'package:hcslzapp/components/my.appbar.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/http/webclients/associated.webclient.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/pages/dependent/dependent.list.dart';
import 'package:hcslzapp/pages/motorcycle/motorcycle.list.dart';

const _titleAppBar = 'Atualizar Meus Dados';
const _labelName = 'Nome *';
const _labelPhone = 'Telefone *';
const _labelEmail = 'Email *';
const _labelSponsor = 'Padrinho';
const _labelNickname = 'Apelido';
const _labelAssociatedType = 'Tipo de Associado';
const _labelCNH = 'CNH';
const _labelCPF = 'CPF';
const _labelRG = 'RG';
const _labelDateBirth = 'Data Nascimento';
const _labelDateShield = 'Data Escudamento';
const _tipDate = 'dd/mm/yyyy';

class AssociatedUpdate extends StatefulWidget {
  @override
  _AssociatedUpdateState createState() => _AssociatedUpdateState();
}

class _AssociatedUpdateState extends State<AssociatedUpdate> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controlllerSponsor = TextEditingController();
  final TextEditingController _controlllerNickName = TextEditingController();
  final TextEditingController _controlllerAssociatedType =
      TextEditingController();
  final TextEditingController _controlllerCNH = TextEditingController();
  final TextEditingController _controlllerCPF = TextEditingController();
  final TextEditingController _controlllerRG = TextEditingController();
  final TextEditingController _controlllerBloodType = TextEditingController();
  final TextEditingController _controlllerDateBirth = TextEditingController();
  final TextEditingController _controlllerDateShield = TextEditingController();
  String _nome;
  List _bloodTypes = List();
  List<DropdownMenuItem<String>> _dropDownBloodTypes;
  String _currentBloodType;
  int _radioValue1 = -1;
  final AssociatedWebClient _webClient = AssociatedWebClient();

  @override
  void initState() {
    _dropDownBloodTypes = _getBloodTypes();
    super.initState();
  }

  // here we are creating the list needed for the DropDownButton
  List<DropdownMenuItem<String>> _getBloodTypes() {
    List<DropdownMenuItem<String>> types = new List();
    //TipoSanguineo.values.forEach((v) => print('value: $v, index: ${v.index}'));
    //TipoSanguineo.values.forEach((v) => print(v.descricao));
    TipoSanguineo.values.forEach((v) => _bloodTypes.add(v.descricao));
    print(_bloodTypes);
    for (String type in _bloodTypes) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      types.add(new DropdownMenuItem(value: type, child: new Text(type)));
    }
    return types;
  }

  //@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_titleAppBar),
      body: FutureBuilder<List<Associado>>(
        /*
        carrega JSON com dados da api
        */
        future: _webClient.findByCodigo(1),
        /*
        -------------------------------
        */
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Associado> associateds = snapshot.data;
                if (associateds.isNotEmpty) {
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
                        child: associatedWidgets(associateds),
                      ),
                    ),
                  );
                }
              }
              return CenteredMessage(
                'Associado nao encontrado.',
                icon: Icons.warning,
              );
              break;
          }
          /*
            este codigo na pratica nao e alcançado (todos os cenarios possiveis ja
            foram tratados acima), podendo assi retornar Null, mas
            deve-se sempre evitar essa situacao
            Envia-se uma msg generica
          */
          return CenteredMessage(
            'Erro desconhecido.',
            icon: Icons.error,
          );
        },
      ),
    );
  }

  Column associatedWidgets(List<Associado> associateds) {
    final Associado associated = associateds[0];
    _currentBloodType = associated.tipoSanguineo;
    return Column(
      children: <Widget>[
        InputTextField(
          controlller: _controllerName,
          label: _labelName,
          icon: Icons.person,
          inputType: TextInputType.text,
          valor: associated.nome,
        ),
        InputTextField(
          controlller: _controllerEmail,
          label: _labelEmail,
          icon: Icons.email,
          inputType: TextInputType.emailAddress,
          valor: associated.email,
        ),
        InputTextField(
          controlller: _controllerPhone,
          label: _labelPhone,
          icon: Icons.phone,
          inputType: TextInputType.phone,
          valor: associated.telefone,
        ),
        InputTextField(
          controlller: _controlllerSponsor,
          label: _labelSponsor,
          icon: Icons.person_pin,
          valor: associated.padrinho == null ? null : associated.padrinho.nome,
          disabled: true,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: InputTextField(
                controlller: _controlllerNickName,
                label: _labelNickname,
                inputType: TextInputType.text,
                valor: associated.apelido,
              ),
            ),
            Expanded(
              child: InputTextField(
                controlller: _controlllerAssociatedType,
                label: _labelAssociatedType,
                valor: associated.tipoAssociado,
                disabled: true,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: InputTextField(
                controlller: _controlllerCNH,
                label: _labelCNH,
                inputType: TextInputType.number,
                valor: associated.cnh,
              ),
            ),
            Expanded(
              child: InputTextField(
                controlller: _controlllerCPF,
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
                controlller: _controlllerRG,
                label: _labelRG,
                inputType: TextInputType.number,
                valor: associated.rg,
              ),
            ),
            Expanded(
              child: Container(
                height: 58.0,
                alignment: Alignment.center,
                child: DropdownButton(
                  hint: Text(
                    "Tipo Sanguineo",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_downward,
                    size: 28,
                  ),
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                  value: _currentBloodType,
                  items: _dropDownBloodTypes,
                  onChanged: changedDropDownItem,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: InputTextField(
                controlller: _controlllerDateBirth,
                label: _labelDateBirth,
                icon: Icons.calendar_today,
                tip: _tipDate,
                inputType: TextInputType.datetime,
                valor: associated.dataNascimento,
              ),
            ),
            Expanded(
              child: InputTextField(
                controlller: _controlllerDateShield,
                label: _labelDateShield,
                icon: Icons.calendar_today,
                tip: _tipDate,
                inputType: TextInputType.datetime,
                valor: associated.dataEscudamento,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        dependentWidgets(associated.dependentes),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        motorcycleWidgets(),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        Button(
          'ATUALIZAR',
          Icons.update,
          onClick: () {
            _update(context);
          },
        ),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
      ],
    );
  }

  Widget dependentWidgets(List<Dependente> dependentes) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 7,
          color: Colors.deepOrange,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Dependentes',
                  style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Spacer(),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white12,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.find_in_page, size: 35),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DependentList(dependentes);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column motorcycleWidgets() {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.deepOrangeAccent,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Motocicletas',
                  style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Spacer(),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white12,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.find_in_page, size: 35),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MotorcycleList();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void changedDropDownItem(String selected) {
    setState(() {
      _currentBloodType = selected;
    });
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  String _validateName(String value) {
    if (value.isEmpty) return 'Nome é obrigatório.';
    final RegExp nomeExp = RegExp(r'^[A-Za-z ]+$');
    if (!nomeExp.hasMatch(value))
      return 'Favor digitar somente caracteres alfabeticos.';
    return null;
  }

  void _update(BuildContext context) {}
}
