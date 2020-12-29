import 'package:flutter/material.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/motorcycle.controller.dart';
import 'package:hcslzapp/models/motorcycle.dart';

class MotorcycleAdd extends StatefulWidget {
  final Motorcycle motorcycle;

  MotorcycleAdd(this.motorcycle);

  @override
  _MotorcycleAddState createState() => _MotorcycleAddState();
}

class _MotorcycleAddState extends State<MotorcycleAdd> {
  MotorcycleController _controller = MotorcycleController();

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
              InputTextField(
                textEditingController: _controller.modelCtrl,
                text:
                    widget.motorcycle != null ? widget.motorcycle.model : null,
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
                      text: widget.motorcycle != null
                          ? widget.motorcycle.year
                          : null,
                      icon: Icons.calendar_today,
                      label: labelYear,
                      hint: hintYear,
                      inputType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.colorCtrl,
                      text: widget.motorcycle != null
                          ? widget.motorcycle.color
                          : null,
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
                      text: widget.motorcycle != null
                          ? widget.motorcycle.licencePlate
                          : null,
                      label: labelLicencePlate,
                      hint: hintLicencePlate,
                      inputType: TextInputType.text,
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.nicknameCtrl,
                      text: widget.motorcycle != null
                          ? widget.motorcycle.nickname
                          : null,
                      label: labelNickname,
                      hint: hintNickname,
                      inputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              InputTextField(
                textEditingController: _controller.chassisCtrl,
                text: widget.motorcycle != null
                    ? widget.motorcycle.chassis
                    : null,
                label: labelChassis,
                hint: hintChassis,
                inputType: TextInputType.text,
              ),
              InputTextField(
                textEditingController: _controller.renavamCtrl,
                text: widget.motorcycle != null
                    ? widget.motorcycle.renavam
                    : null,
                label: labelRenavam,
                hint: hintRenavam,
                inputType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          Button(icon: Icons.playlist_add,
              onClick: () => _controller.add(context)),
    );
  }
}
