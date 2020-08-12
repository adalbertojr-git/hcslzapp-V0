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
import 'package:hcslzapp/components/top.space.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/http/webclients/associated.webclient.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';
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
    BloodType.values.forEach((v) => _bloodTypes.add(v.description));
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
      //appBar: MyAppBar(_titleAppBar),
      body: FutureBuilder<List<Associated>>(
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
                final List<Associated> associateds = snapshot.data;
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
      floatingActionButton: Button(
        Icons.save,
        onClick: () {
          _update(context);
        },
      ),
    );
  }

  Column associatedWidgets(List<Associated> associateds) {
    final Associated associated = associateds[0];
    _currentBloodType = associated.bloodType;
    return Column(
      children: <Widget>[
        TopSpace(),
        SizedBox(
          height: 10.0,
          width: double.infinity,
        ),
        _photo(),
        InputTextField(
          controlller: _controllerName,
          label: _labelName,
          icon: Icons.person,
          inputType: TextInputType.text,
          valor: associated.name,
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
          valor: associated.phone,
        ),
        InputTextField(
          controlller: _controlllerSponsor,
          label: _labelSponsor,
          icon: Icons.person_pin,
          valor: associated.sponsor == null ? null : associated.sponsor.name,
          disabled: true,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: InputTextField(
                controlller: _controlllerNickName,
                label: _labelNickname,
                inputType: TextInputType.text,
                valor: associated.nickname,
              ),
            ),
            Expanded(
              child: InputTextField(
                controlller: _controlllerAssociatedType,
                label: _labelAssociatedType,
                valor: associated.associatedType,
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
                valor: associated.dateBirth,
              ),
            ),
            Expanded(
              child: InputTextField(
                controlller: _controlllerDateShield,
                label: _labelDateShield,
                icon: Icons.calendar_today,
                tip: _tipDate,
                inputType: TextInputType.datetime,
                valor: associated.dateShield,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        Container(
          height: 350,
          child: DependentsAndMotorcycles(
            associated.dependents,
            associated.motorcycles,
          ),
        ),

/*        dependentWidgets(associated.dependents),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        motorcycleWidgets(),
        */

/*        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        Button(
          Icons.save,
          onClick: () {
            _update(context);
          },
        ),*/
      ],
    );
  }

  Container _photo() {
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
            image: AssetImage('assets/imgs/noImage.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

/*
  Widget dependentWidgets(List<Dependent> dependentes) {
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
  }*/

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

class DependentsAndMotorcycles extends StatelessWidget {
  List<Dependent> dependents;
  List<Motorcycle> motorcycles;

  DependentsAndMotorcycles(this.dependents, this.motorcycles);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Cards(
            title: "Dependentes",
            image: "assets/imgs/dependentes.png",
            count: this.dependents.length,
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DependentList(this.dependents);
                  },
                ),
              );
            },
          ),
          Cards(
            title: "Motocicletas",
            image: "assets/imgs/motocicletas.png",
            count: this.motorcycles.length,
            onClick: () {
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
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final String image;
  final String title;
  final int count;
  final Function onClick;

  Cards({
    @required this.image,
    @required this.title,
    @required this.count,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      width: (MediaQuery.of(context).size.width / 2) - 15,
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              onClick();
            },
            child: Hero(
              tag: image,
              child: Image.asset(
                image,
                width: 170,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 70,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "Quantidade: " + this.count.toString(),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Click na imagem para detalhes...",
            style: TextStyle(
              fontSize: 9.0,
            ),
          ),
        ],
      ),
    );
  }
}
