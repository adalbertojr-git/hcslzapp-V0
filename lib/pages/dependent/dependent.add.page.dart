import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/controllers/dependent.controller.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Dependente';

class DependentAddPage extends StatefulWidget {
  final Dependent? dependent;

  DependentAddPage(this.dependent);

  @override
  _DependentAddPageState createState() => _DependentAddPageState();
}

class _DependentAddPageState extends State<DependentAddPage> {
  final DependentController _controller = DependentController();

  @override
  void initState() {
    _controller.dependent = widget.dependent ?? _controller.dependent;
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: MyAppBar(widget.dependent == null
            ? 'Adicionar ' + _title
            : 'Editar ' + _title),
        bottomNavigationBar: MyBottomAppBar(),
        body: _widgets(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Button(
            icon: Icons.playlist_add, onClick: () => _controller.add(context)),
      ),
    );
  }

  _widgets() => ListView(
        children: <Widget>[
          Observer(
            builder: (_) {
              return MyTextFormField(
                textEditingController: _controller.nameCtrl,
                label: labelNameDependent,
                hint: hintNameDependent,
                icon: Icons.person,
                inputType: TextInputType.text,
                onChanged: _controller.formController.changeName,
                errorText: _controller.validateName(),
              );
            },
          ),
          Observer(
            builder: (_) {
              return MyTextFormField(
                textEditingController: _controller.emailCtrl,
                label: labelEmail,
                hint: hintEmail,
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
                onChanged: _controller.formController.changeEmail,
                errorText: _controller.validateEmail(),
              );
            },
          ),
          Row(
            children: [
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.phoneCtrl,
                  label: labelPhone,
                  hint: hintPhone,
                  inputType: TextInputType.phone,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "(##) #####-####"),
                ),
              ),
              Expanded(
                  child: MyTextFormField(
                textEditingController: _controller.dateBirthCtrl,
                label: labelDateBirth,
                hint: hintDate,
                inputType: TextInputType.datetime,
                maskTextInputFormatter:
                    MaskTextInputFormatter(mask: "##/##/####"),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: const Text(
                    'Tipo Sanguineo:',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 58.0,
                    child: DropdownButtonFormField(
                      value: _controller.currentBloodType,
                      items: getBloodTypes(),
                      onChanged: _controller.changedDropDownItem,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: const Text(
                    'Membro Harley Club?',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Switch(
                    activeColor: Colors.orangeAccent,
                    value: _controller.isAssociated,
                    onChanged: (value) {
                      _controller.setAssociated();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
