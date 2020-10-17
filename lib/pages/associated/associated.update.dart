/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que permite ao associado logado atualizar seus dados cadastrais

OBS: o padrinho, o tipo de membro e a data de escudamento sao definidas pela
administracao do App e nao podem ser alteradas pelo associado

*/
import 'dart:io';
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
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:hcslzapp/pages/dependent/dependent.add.dart';
import 'package:hcslzapp/pages/dependent/dependent.list.dart';
import 'package:hcslzapp/pages/motorcycle/motorcycle.add.dart';
import 'package:hcslzapp/pages/motorcycle/motorcycle.list.dart';
import 'package:image_picker/image_picker.dart';

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
  final AssociatedWebClient _webClient = AssociatedWebClient();
  Future<List<Associated>> _future;
  bool isLoading = true;
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    getFuture().then((value) {
      setState(() {
        _future = getFuture();
        isLoading = false;
      });
    });
    _dropDownBloodTypes = _getBloodTypes();
    super.initState();
  }

  Future<List<Associated>> getFuture() async {
    return _webClient.findByCodigo(1);
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
    return Scaffold(
      body: FutureBuilder<List<Associated>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Associated> associatedList = snapshot.data;
              if (associatedList.isNotEmpty) {
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
                      child: associatedWidgets(context, associatedList),
                    ),
                  ),
                );
              } //if (associatedList.isNotEmpty) {
/*
              else if (snapshot.hasError){
                return CenteredMessage(
                  'Erro na consulta. Verifique a conexao.',
                  icon: Icons.error,
                );
              }
*/
              else {
                return CenteredMessage(
                  'Dados nao encontrados.',
                  icon: Icons.warning,
                );
              }
            } //if (snapshot.hasData)
            else {
              return Progress();
            }
          }),
      floatingActionButton: isLoading
          ? null
          : Button(
              Icons.save,
              onClick: () {
                _update(context);
              },
            ),
    );
  }

  /* @override
  Widget buildx(BuildContext context) {
    return Scaffold(
      //appBar: MyAppBar(_titleAppBar)
      body: FutureBuilder<List<Associated>>(
        future: _future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return CenteredMessage(
                'Sem conexao com o servidor.',
                icon: Icons.error,
              );
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Associated> associatedList = snapshot.data;
                if (associatedList.isNotEmpty) {
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
                        child: associatedWidgets(associatedList),
                      ),
                    ),
                  );
                }
              } //if (snapshot.hasData)
              return CenteredMessage(
                'Associado nao encontrado.',
                icon: Icons.warning,
              );
              break;
          } //switch (snapshot.connectionState)

          */ /*
            este codigo na pratica nao e alcançado (todos os cenarios possiveis ja
            foram tratados acima), podendo assi retornar Null, mas
            deve-se sempre evitar essa situacao
            Envia-se uma msg generica
          */ /*
          return CenteredMessage(
            'Erro desconhecido.',
            icon: Icons.error,
          );
        },
      ),
      floatingActionButton: isLoading
          ? null
          : Button(: () {
                _upd
              Icons.save,
              onClickate(context);
              },
            ),
    );
  }
*/
  Column associatedWidgets(
      BuildContext context, List<Associated> associatedList) {
    final Associated associated = associatedList[0];
    _currentBloodType = associated.bloodType;
    return Column(
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
          inputType: TextInputType.text,
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
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
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
        Divider(),
        DependentsAndMotorcyclesListWidget(
          'Dependentes',
          dependents: associated.dependents,
        ),
        SizedBox(
          height: 10.0,
        ),
        DependentsAndMotorcyclesListWidget(
          'Motocicletas',
          motorcycles: associated.motorcycles,
        ),
        SizedBox(
          height: 100.0,
        ),
      ],
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

  Container DependentsAndMotorcyclesListWidget(String title,
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return dependents != null
                              ? DependentAdd(dependents[i])
                              : MotorcycleAdd();
                        },
                      ),
                    );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return dependents != null
                          ? DependentAdd(null)
                          : MotorcycleAdd();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
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

  void changedDropDownItem(String selected) {
    setState(() {
      _currentBloodType = selected;
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

/*class DependentsAndMotorcycles extends StatelessWidget {
  List<Dependent> dependents;
  List<Motorcycle> motorcycles;

  DependentsAndMotorcycles(this.dependents, this.motorcycles);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white10,
      child: DefaultTabController(
        length: 2,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 220,
                  child: IconTheme(
                    data: IconThemeData(
                      size: 128.0,
                    ),
                    child: TabBarView(
                      children: <Widget>[
                        Tabs(
                          image: "assets/imgs/dependentes.png",
                          title: "Lista de Dependentes",
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
                        Tabs(
                          image: "assets/imgs/motocicletas.png",
                          title: "Lista de Motocicletas",
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
                  ),
                ),
                TabPageSelector(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  final String image;
  final String title;
  final Function onClick;

  Tabs({
    @required this.image,
    @required this.title,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Hero(
            tag: image,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          onTap: () {
            onClick();
          },
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16.0),
        ),
        Text(
          "Clique para ver detalhes",
          style: TextStyle(fontSize: 12.0),
        )
      ],
    );
  }
}*/
