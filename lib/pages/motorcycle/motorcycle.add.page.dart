import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/controllers/motorcycle.controller.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Motocicleta';

class MotorcycleAddPage extends StatefulWidget {
  final Motorcycle? motorcycle;

  MotorcycleAddPage(this.motorcycle);

  @override
  _MotorcycleAddPageState createState() => _MotorcycleAddPageState();
}

class _MotorcycleAddPageState extends State<MotorcycleAddPage> {
  final MotorcycleController _controller = MotorcycleController();

  @override
  void initState() {
    _controller.motorcycle = widget.motorcycle ?? _controller.motorcycle;
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(widget.motorcycle == null
            ? 'Adicionar ' + _title
            : 'Editar ' + _title),
        bottomNavigationBar: MyBottomAppBar(),
        body: _widgets(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Button(
            icon: Icons.playlist_add, onClick: () => _controller.add(context)),
      );

  _widgets() => ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Observer(
            builder: (_) {
              return MyTextFormField(
                textEditingController: _controller.modelCtrl,
                label: labelModel,
                hint: hintModel,
                icon: Icons.motorcycle,
                inputType: TextInputType.text,
                onChanged: _controller.formController.changeModel,
                errorText: _controller.validateModel(),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.yearCtrl,
                  icon: Icons.calendar_today,
                  label: labelYear,
                  hint: hintYear,
                  inputType: TextInputType.number,
                  maskTextInputFormatter: MaskTextInputFormatter(mask: "####"),
                ),
              ),
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.colorCtrl,
                  icon: Icons.color_lens,
                  label: labelColor,
                  hint: hintColor,
                  inputType: TextInputType.text,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.licencePlateCtrl,
                  label: labelLicencePlate,
                  hint: hintLicencePlate,
                  inputType: TextInputType.text,
                ),
              ),
              Expanded(
                child: MyTextFormField(
                  textEditingController: _controller.nicknameCtrl,
                  label: labelNickname,
                  hint: hintNickname,
                  inputType: TextInputType.text,
                ),
              ),
            ],
          ),
          MyTextFormField(
            textEditingController: _controller.chassisCtrl,
            label: labelChassis,
            hint: hintChassis,
            inputType: TextInputType.text,
          ),
          MyTextFormField(
            textEditingController: _controller.renavamCtrl,
            label: labelRenavam,
            hint: hintRenavam,
            inputType: TextInputType.text,
          ),
        ],
      );
}
