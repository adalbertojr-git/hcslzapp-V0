import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/dependent.controller.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/models/dependent.dart';

class DependentAdd extends StatefulWidget {
  final Dependent dependent;

  DependentAdd(this.dependent);

  @override
  _DependentAddState createState() => _DependentAddState();
}

class _DependentAddState extends State<DependentAdd> {
  DependentController _controller = DependentController();

  @override
  void initState() {
    _controller.currentBloodType = widget.dependent != null
        ? widget.dependent.bloodType
        : getBloodTypes().first.value;
    _controller.isAssociated = (widget.dependent != null
        ? (widget.dependent.isAssociated == 'S' ? true : false)
        : false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
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
                  textEditingController: _controller.nameCtrl,
                  text:
                      widget.dependent != null ? widget.dependent.name : null,
                  label: labelNameDependent,
                  hint: hintNameDependent,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                ),
                InputTextField(
                  textEditingController: _controller.emailCtrl,
                  text:
                      widget.dependent != null ? widget.dependent.email : null,
                  label: labelEmail,
                  hint: hintEmail,
                  icon: Icons.email,
                  inputType: TextInputType.emailAddress,
                ),
                InputTextField(
                  textEditingController: _controller.phoneCtrl,
                  text:
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
                            items: getBloodTypes(),
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
                        textEditingController: _controller.cpfCtrl,
                        text: widget.dependent != null
                            ? widget.dependent.cpf
                            : null,
                        label: labelCPF,
                        hint: hintCPF,
                        inputType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: InputTextField(
                        textEditingController: _controller.dateBirthCtrl,
                        text: widget.dependent != null
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
                    activeColor: Colors.orangeAccent,
                    value: _controller.isAssociated,
                    onChanged: (value) {
                      _controller.associated();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton:
            Button(icon: Icons.playlist_add,
                onClick: () => _controller.add(context)),
      ),
    );
  }
}
