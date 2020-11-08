import 'package:flutter/material.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/models/dependent.dart';

const _rotuloNome = 'Nome *';
const _rotuloTelefone = 'Telefone *';
const _rotuloEmail = 'Email *';
const _labelCPF = 'CPF';
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
  final TextEditingController _controlllerCPF = TextEditingController();
  final TextEditingController _controladorDataNascimento =
      TextEditingController();
  final TextEditingController _controladorMembroHC = TextEditingController();
  String _nome;
  List _bloodTypes = List();
  List<DropdownMenuItem<String>> _dropDownBloodTypes;
  String _currentBloodType;
  bool ehMembro = false;

  @override
  void initState() {
    _dropDownBloodTypes = getBloodTypes();
    _controladorNome.text = widget.dependente != null ? widget.dependente.name : null;
    super.initState();
  }

  //@override
  Widget build(BuildContext context) {
    _currentBloodType =
        widget.dependente != null ? widget.dependente.bloodType : null;
    return Scaffold(
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
                SizedBox(
                  height: 20.0,
                ),
                InputTextField(
                  controller: _controladorNome,
                  label: _rotuloNome,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                  //valor:
                      //widget.dependente != null ? widget.dependente.name : null,
                ),
                InputTextField(
                  controller: _controladorEmail,
                  label: _rotuloEmail,
                  icon: Icons.email,
                  inputType: TextInputType.emailAddress,
                  valor: widget.dependente != null
                      ? widget.dependente.email
                      : null,
                ),
                InputTextField(
                  controller: _controladorTelefone,
                  label: _rotuloTelefone,
                  icon: Icons.phone,
                  inputType: TextInputType.phone,
                  valor: widget.dependente != null
                      ? widget.dependente.phone
                      : null,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Expanded(
                      child: InputTextField(
                        controller: _controlllerCPF,
                        label: _labelCPF,
                        inputType: TextInputType.number,
                        //valor: associated.cpf,
                      ),
                    ),
                    Expanded(
                      child: InputTextField(
                        controller: _controladorDataNascimento,
                        label: _rotuloDataNascimento,
                        icon: Icons.calendar_today,
                        tip: _dicaData,
                        inputType: TextInputType.datetime,
                        valor: widget.dependente != null
                            ? widget.dependente.dateBirth
                            : null,
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
                          onChanged: changedDropDownItem,
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
                    border: Border.all(color: Colors.white70),
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Button(
        Icons.playlist_add,
        onClick: () {
          _add(context);
        },
      ),
    );
  }

  void changedDropDownItem(String selected) {
    setState(
      () {
        _currentBloodType = selected;
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

  void _add(BuildContext context) {
    //final int codigo = int.parse(_controladorCodigo.text);
    debugPrint('Criando dependente...');
    final String nome = _controladorNome.text;
    final String email = _controladorEmail.text;
    final String telefone = _controladorTelefone.text;
    final String cpf = _controladorTelefone.text;

    debugPrint('nome $nome');

    final String tipoSanguineo =
        (_bloodTypes.indexOf(_currentBloodType) != 0
            ? _currentBloodType.toString()
            : '');
    final String dataNascimento = _controladorDataNascimento.text;
    final String membroHC = (ehMembro == true ? 'S' : 'N');

    if (nome != '' && email != '' && telefone != '') {
      final dependenteCriado = Dependent(
          0, nome, email, telefone, cpf, tipoSanguineo, dataNascimento, membroHC);
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
