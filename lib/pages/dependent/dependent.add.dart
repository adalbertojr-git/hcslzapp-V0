import 'package:flutter/material.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.appbar.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/models/dependent.dart';

const _tituloAppBar = 'Dependente';
const _rotuloNome = 'Nome *';
const _rotuloTelefone = 'Telefone *';
const _rotuloEmail = 'Email *';
const _rotuloTipoSanguineo = 'Tipo Sanguineo';
const _rotuloDataNascimento = 'Data de Nascimento';
const _dicaData = 'dd/mm/yyyy';

class DependentAdd extends StatefulWidget {
  final Dependent dependente;

  DependentAdd(this.dependente);

  @override
  _DependentAddState createState() => _DependentAddState();
}

class _DependentAddState extends State<DependentAdd> {
  final TextEditingController _controladorCodigo = TextEditingController();
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorDataNascimento =
      TextEditingController();
  final TextEditingController _controladorMembroHC = TextEditingController();
  String _nome;
  List _tiposSanguineos = List();
  List<DropdownMenuItem<String>> _dropDownTiposSanguineos;
  String _currentTipoSanguineo;
  bool ehMembro = false;

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
    BloodType.values.forEach((v) => _tiposSanguineos.add(v.description));
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
    _currentTipoSanguineo =
        widget.dependente != null ? widget.dependente.bloodType : null;
    return Scaffold(
      //appBar: MyAppBar(_tituloAppBar),
      body: Container(
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
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
                SizedBox (
                  height: 20.0,
                ),
                InputTextField(
                  controlller: _controladorNome,
                  label: _rotuloNome,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                  valor:
                      widget.dependente != null ? widget.dependente.name : null,
                ),
                InputTextField(
                  controlller: _controladorEmail,
                  label: _rotuloEmail,
                  icon: Icons.email,
                  inputType: TextInputType.emailAddress,
                  valor: widget.dependente != null
                      ? widget.dependente.email
                      : null,
                ),
                InputTextField(
                  controlller: _controladorTelefone,
                  label: _rotuloTelefone,
                  icon: Icons.phone,
                  inputType: TextInputType.phone,
                  valor: widget.dependente != null
                      ? widget.dependente.phone
                      : null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: InputTextField(
                        controlller: _controladorDataNascimento,
                        label: _rotuloDataNascimento,
                        icon: Icons.calendar_today,
                        tip: _dicaData,
                        inputType: TextInputType.datetime,
                        valor: widget.dependente != null
                            ? widget.dependente.dateBirth
                            : null,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                        height: 58.0,
//                        decoration: BoxDecoration(
//                          border: Border.all(color: Colors.black12),
//                          borderRadius: BorderRadius.all(
//                            Radius.circular(5.0),
//                          ),
//                        ),
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
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            value: _currentTipoSanguineo,
                            items: _dropDownTiposSanguineos,
                            onChanged: changedDropDownItem,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                  child: Text(
                    'Membro Harley Club?',
                    style: new TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Container(
                  height: 58.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Switch(
                    value: (widget.dependente != null
                        ? (widget.dependente.isAssociated == 'S' ? true : false)
                        : false),
                    onChanged: (value) {
                      setState(
                        () {
                          ehMembro = value;
                        },
                      );
                    },
                    activeTrackColor: Colors.black,
                    activeColor: Colors.orange,
                  ),
                ),
/*                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Button(
                  Icons.save,
                  onClick: () {
                    _save(context);
                  },
                ),*/
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Button(
        Icons.save,
        onClick: () {
          _save(context);
        },
      ),
    );
  }

  void changedDropDownItem(String selected) {
    setState(
      () {
        _currentTipoSanguineo = selected;
      },
    );
  }

  String _validaNome(String value) {
    if (value.isEmpty) return 'Nome is obrigatorio.';
    final RegExp nomeExp = RegExp(r'^[A-Za-z ]+$');
    if (!nomeExp.hasMatch(value))
      return 'Favor digitar somente caracteres alfabeticos.';
    return null;
  }

  void _save(BuildContext context) {
    //final int codigo = int.parse(_controladorCodigo.text);
    final String nome = _controladorNome.text;
    final String email = _controladorEmail.text;
    final String telefone = _controladorTelefone.text;
    final String tipoSanguineo =
        (_tiposSanguineos.indexOf(_currentTipoSanguineo) != 0
            ? _currentTipoSanguineo.toString()
            : '');
    final String dataNascimento = _controladorDataNascimento.text;
    final String membroHC = (ehMembro == true ? 'S' : 'N');

    if (nome != '' && email != '' && telefone != '') {
      final dependenteCriado = Dependent(
          0, nome, email, telefone, tipoSanguineo, dataNascimento, membroHC);
      debugPrint('Criando dependente...');
      debugPrint('$dependenteCriado');
      /*
      pop = manda resposta para o push (then)
      remove a tela da pilha de navegação. Ou seja, o push() adiciona uma tela
      à pilha, e o pop() a remove.
      */
      Navigator.pop(context, dependenteCriado);
    }
  }
}
