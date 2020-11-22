import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/top.margin.dart';
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
  DependentController _controller = DependentController();
  List<DropdownMenuItem<String>> _dropDownBloodTypes;

  @override
  void initState() {
    _dropDownBloodTypes = getBloodTypes();
    _controller.currentBloodType = widget.dependent != null
        ? widget.dependent.bloodType
        : _dropDownBloodTypes.first.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build Dependent");
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TopMargin(),
              InputTextField(
                controller: _controller.nameCtrl,
                controllerText:
                    widget.dependent != null ? widget.dependent.name : null,
                label: labelNameDependent,
                hint: hintNameDependent,
                icon: Icons.person,
                inputType: TextInputType.text,
              ),
              InputTextField(
                controller: _controller.emailCtrl,
                controllerText:
                    widget.dependent != null ? widget.dependent.email : null,
                label: labelEmail,
                hint: hintEmail,
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
              ),
              InputTextField(
                controller: _controller.phoneCtrl,
                controllerText:
                    widget.dependent != null ? widget.dependent.phone : null,
                label: labelPhone,
                hint: hintPhone,
                icon: Icons.phone,
                inputType: TextInputType.phone,
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
                          value: _controller.currentBloodType,
                          items: _dropDownBloodTypes,
                          onChanged: _controller.changedDropDownItem,
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
                      controller: _controller.cpfCtrl,
                      controllerText: widget.dependent != null
                          ? widget.dependent.cpf
                          : null,
                      label: labelCPF,
                      hint: hintCPF,
                      inputType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      controller: _controller.dateBirthCtrl,
                      controllerText: widget.dependent != null
                          ? widget.dependent.dateBirth
                          : null,
                      label: labelDateBirth,
                      hint: hintDate,
                      icon: Icons.calendar_today,
                      inputType: TextInputType.datetime,
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
                    _controller.associated();
                    print("value: $value");
                    print(_controller.isAssociated);
                  },
                ),
              ),
            ],
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

  _add(BuildContext context) {
    print('Criando dependente...');
    _controller.idCtrl.text = "0";
    final int id = int.parse(_controller.idCtrl.text);
    final String name = _controller.nameCtrl.text;
    final String email = _controller.emailCtrl.text;
    final String phone = _controller.phoneCtrl.text;
    final String cpf = _controller.cpfCtrl.text;
    final String bloodType = _controller.currentBloodType;
    final String dateBirth = _controller.dateBirthCtrl.text;
    final String isAssociated = (_controller.isAssociated ? 'S' : 'N');
    if (name != '' && email != '' && phone != '') {
      final dependent = Dependent(
          0, name, email, phone, cpf, bloodType, dateBirth, isAssociated);
      /*
      pop = manda resposta para o push (then)
      remove a tela da pilha de navegação. Ou seja, o push() adiciona uma tela
      à pilha, e o pop() a remove.
      */
      Navigator.pop(context, dependent);
    }
  }
}
