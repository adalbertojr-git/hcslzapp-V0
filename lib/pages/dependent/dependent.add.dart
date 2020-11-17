import 'package:flutter/material.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/controllers/dependent.controller.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:provider/provider.dart';

class DependentAdd extends StatefulWidget {
  final Dependent dependent;

  DependentAdd(this.dependent);

  @override
  _DependentAddState createState() => _DependentAddState();
}

class _DependentAddState extends State<DependentAdd> {
  DependentController _dependentController;
  List _bloodTypes = List();
  List<DropdownMenuItem<String>> _dropDownBloodTypes;
  String _currentBloodType;
  bool ehMembro = false;

  @override
  void initState() {
    _dependentController = Provider.of<DependentController>(context, listen: false);
    _dependentController.nameCtrl.text = widget.dependent != null ? widget.dependent.name : null;
    _dropDownBloodTypes = getBloodTypes();
    super.initState();
  }

  //@override
  Widget build(BuildContext context) {
    _currentBloodType =
        widget.dependent != null ? widget.dependent.bloodType : null;
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
                  controller: _dependentController.nameCtrl,
                  label: labelNameDependent,
                  hint: hintNameDependent,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                ),
                InputTextField(
                  controller: _dependentController.emailCtrl,
                  label: labelEmail,
                  hint: hintEmail,
                  icon: Icons.email,
                  inputType: TextInputType.emailAddress,
                ),
                InputTextField(
                  controller: _dependentController.phoneCtrl,
                  label: labelPhone,
                  hint: hintPhone,
                  icon: Icons.phone,
                  inputType: TextInputType.phone,
/*                  label: widget.dependent != null
                      ? widget.dependent.phone
                      : null,*/
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
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Expanded(
                      child: InputTextField(
                        controller: _dependentController.cpfCtrl,
                        label: labelCPF,
                        hint: hintCPF,
                        inputType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: InputTextField(
                        controller: _dependentController.dateBirthCtrl,
                        label: labelDateBirth,
                        hint: hintDate,
                        icon: Icons.calendar_today,
                        inputType: TextInputType.datetime,
/*                        label: widget.dependent != null
                            ? widget.dependent.dateBirth
                            : null,*/
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
                    value: (widget.dependent != null
                        ? (widget.dependent.isAssociated == 'S' ? true : false)
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

  void _add(BuildContext context) {
    debugPrint('Criando dependente...');
    final int codigo = int.parse(_dependentController.idCtrl.text);
    final String nome = _dependentController.nameCtrl.text;
    final String email = _dependentController.emailCtrl.text;
    final String telefone = _dependentController.phoneCtrl.text;
    final String cpf = _dependentController.cpfCtrl.text;

    debugPrint('nome $nome');

    final String tipoSanguineo =
        (_bloodTypes.indexOf(_currentBloodType) != 0
            ? _currentBloodType.toString()
            : '');
    final String dataNascimento = _dependentController.dateBirthCtrl.text;
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
