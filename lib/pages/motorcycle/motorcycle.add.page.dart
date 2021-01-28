import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/motorcycle.controller.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MotorcycleAdd extends StatefulWidget {
  final Motorcycle motorcycle;

  MotorcycleAdd(this.motorcycle);

  @override
  _MotorcycleAddState createState() => _MotorcycleAddState();
}

class _MotorcycleAddState extends State<MotorcycleAdd> {
  MotorcycleController _controller = MotorcycleController();

  @override
  void initState() {
    _controller.motorcycle =
        widget.motorcycle != null ? widget.motorcycle : null;
    _controller.init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              Observer(
                builder: (_) {
                  return InputTextField(
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
              InputTextField(
                textEditingController: _controller.modelCtrl,
                label: labelModel,
                hint: hintModel,
                icon: Icons.motorcycle,
                inputType: TextInputType.text,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InputTextField(
                          textEditingController: _controller.yearCtrl,
                          icon: Icons.calendar_today,
                          label: labelYear,
                          hint: hintYear,
                          inputType: TextInputType.number,
                          maskTextInputFormatter:
                              MaskTextInputFormatter(mask: "####"),
                        ),
                    ),
                  Expanded(
                    child: InputTextField(
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
                    child: InputTextField(
                      textEditingController: _controller.licencePlateCtrl,
                      label: labelLicencePlate,
                      hint: hintLicencePlate,
                      inputType: TextInputType.text,
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.nicknameCtrl,
                      label: labelNickname,
                      hint: hintNickname,
                      inputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              InputTextField(
                textEditingController: _controller.chassisCtrl,
                label: labelChassis,
                hint: hintChassis,
                inputType: TextInputType.text,
              ),
              InputTextField(
                textEditingController: _controller.renavamCtrl,
                label: labelRenavam,
                hint: hintRenavam,
                inputType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Button(
          icon: Icons.playlist_add, onClick: () => _controller.add(context)),
    );
  }
}
