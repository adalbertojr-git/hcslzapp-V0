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
import 'package:hcslzapp/components/appBar.dart';
import 'package:hcslzapp/components/blood_types.dart';
import 'package:hcslzapp/components/botao.dart';
import 'package:hcslzapp/components/centered_message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/text_field.dart';
import 'package:hcslzapp/http/webclients/associado_webclient.dart';
import 'package:hcslzapp/models/associado.dart';
import 'package:hcslzapp/models/dependente.dart';
import 'package:hcslzapp/screens/dependente/lista_dependente.dart';
import 'package:hcslzapp/screens/motocicleta/lista_motocicleta.dart';

const _tituloAppBar = 'Atualizar Meus Dados';
const _rotuloNome = 'Nome *';
const _rotuloTelefone = 'Telefone *';
const _rotuloEmail = 'Email *';
const _rotuloPadrinho = 'Padrinho';
const _rotuloApelido = 'Apelido';
const _rotuloTipoAssociado = 'Tipo de Associado';
const _rotuloCnh = 'CNH';
const _rotuloCpf = 'CPF';
const _rotuloRg = 'RG';
const _rotuloTipoSanguineo = 'Tipo Sanguineo';
const _rotuloDataNascimento = 'Data Nascimento';
const _rotuloDataEscudamento = 'Data Escudamento';
const _dicaData = 'dd/mm/yyyy';

class AtualizarAssociado extends StatefulWidget {
  @override
  _AtualizarAssociadoState createState() => _AtualizarAssociadoState();
}

class _AtualizarAssociadoState extends State<AtualizarAssociado> {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorPadrinho = TextEditingController();
  final TextEditingController _controladorApelido = TextEditingController();
  final TextEditingController _controladorTipoAssociado = TextEditingController();
  final TextEditingController _controladorCnh = TextEditingController();
  final TextEditingController _controladorCpf = TextEditingController();
  final TextEditingController _controladorRg = TextEditingController();
  final TextEditingController _controladorTipoSanguineo =
      TextEditingController();
  final TextEditingController _controladorDataNascimento =
      TextEditingController();
  final TextEditingController _controladorDataEscudamento =
      TextEditingController();
  String _nome;
  List _tiposSanguineos = List();
  List<DropdownMenuItem<String>> _dropDownTiposSanguineos;
  String _currentTipoSanguineo;
  int _radioValue1 = -1;
  final AssociadoWebClient _webClient = AssociadoWebClient();

  @override
  void initState() {
    _dropDownTiposSanguineos = getTiposSanguineos();
    super.initState();
  }

  // here we are creating the list needed for the DropDownButton
  List<DropdownMenuItem<String>> getTiposSanguineos() {
    List<DropdownMenuItem<String>> tipos = new List();
    //TipoSanguineo.values.forEach((v) => print('value: $v, index: ${v.index}'));
    //TipoSanguineo.values.forEach((v) => print(v.descricao));
    TipoSanguineo.values.forEach((v) => _tiposSanguineos.add(v.descricao));
    print(_tiposSanguineos);
    for (String tipo in _tiposSanguineos) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      tipos.add(new DropdownMenuItem(value: tipo, child: new Text(tipo)));
    }
    return tipos;
  }

  //@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_tituloAppBar),
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
                final List<Associado> associados = snapshot.data;
                if (associados.isNotEmpty) {
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
                        child: camposAssociado(associados),
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

  Column camposAssociado(List<Associado> associados) {
    final Associado associado = associados[0];
    _currentTipoSanguineo = associado.tipoSanguineo;
    return Column(
      children: <Widget>[
        Editor(
          controlador: _controladorNome,
          rotulo: _rotuloNome,
          icone: Icons.person,
          inputType: TextInputType.text,
          valor: associado.nome,
        ),
        Editor(
          controlador: _controladorEmail,
          rotulo: _rotuloEmail,
          icone: Icons.email,
          inputType: TextInputType.emailAddress,
          valor: associado.email,
        ),
        Editor(
          controlador: _controladorTelefone,
          rotulo: _rotuloTelefone,
          icone: Icons.phone,
          inputType: TextInputType.phone,
          valor: associado.telefone,
        ),
        Editor(
          controlador: _controladorPadrinho,
          rotulo: _rotuloPadrinho,
          icone: Icons.person_pin,
          valor: associado.padrinho == null ? null : associado.padrinho.nome,
          desabilitado: true,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Editor(
                controlador: _controladorApelido,
                rotulo: _rotuloApelido,
                inputType: TextInputType.text,
                valor: associado.apelido,
              ),
            ),
            Expanded(
              child: Editor(
                controlador: _controladorTipoAssociado,
                rotulo: _rotuloTipoAssociado,
                valor: associado.tipoAssociado,
                desabilitado: true,
              ),

            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Editor(
                controlador: _controladorCnh,
                rotulo: _rotuloCnh,
                inputType: TextInputType.number,
                valor: associado.cnh,
              ),
            ),
            Expanded(
              child: Editor(
                controlador: _controladorCpf,
                rotulo: _rotuloCpf,
                inputType: TextInputType.number,
                valor: associado.cpf,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Editor(
                controlador: _controladorRg,
                rotulo: _rotuloRg,
                inputType: TextInputType.number,
                valor: associado.rg,
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
                  value: _currentTipoSanguineo,
                  items: _dropDownTiposSanguineos,
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
              child: Editor(
                controlador: _controladorDataNascimento,
                rotulo: _rotuloDataNascimento,
                icone: Icons.calendar_today,
                dica: _dicaData,
                inputType: TextInputType.datetime,
                valor: associado.dataNascimento,
              ),
            ),
            Expanded(
              child: Editor(
                controlador: _controladorDataEscudamento,
                rotulo: _rotuloDataEscudamento,
                icone: Icons.calendar_today,
                dica: _dicaData,
                inputType: TextInputType.datetime,
                valor: associado.dataEscudamento,
              ),
            ),
          ],
        ),

        /*       Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Sexo:',
            style: new TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
        Container(
          height: 58.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              Text(
                'Masculino',
                style: TextStyle(fontSize: 16.0),
              ),
              Radio(
                value: 1,
                groupValue: _radioValue1,
                onChanged: _handleRadioValueChange1,
              ),
              Text(
                'Feminino',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
 */
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        dependentes(associado.dependentes),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        motocicletas(),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
        Botao(
          'ATUALIZAR',
          Icons.update,
          onClick: () {
            _atualizar(context);
          },
        ),
        Padding(
          padding: EdgeInsets.all(5.0),
        ),
      ],
    );
  }

  Widget dependentes(List<Dependente> dependentes) {
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
                          return ListaDependentes(dependentes);
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

  Column motocicletas() {
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
                          return ListaMotocicletas();
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
      _currentTipoSanguineo = selected;
    });
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  String _validaNome(String value) {
    if (value.isEmpty) return 'Nome é obrigatório.';
    final RegExp nomeExp = RegExp(r'^[A-Za-z ]+$');
    if (!nomeExp.hasMatch(value))
      return 'Favor digitar somente caracteres alfabeticos.';
    return null;
  }

  void _atualizar(BuildContext context) {}
}