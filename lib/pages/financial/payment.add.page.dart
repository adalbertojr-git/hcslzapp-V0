import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/payment.add.controller.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PaymentAdd extends StatefulWidget {
  final Payment _payment;

  PaymentAdd(this._payment);

  @override
  _PaymentAddAddState createState() => _PaymentAddAddState();
}

class _PaymentAddAddState extends State<PaymentAdd> {
  PaymentAddController _controller = PaymentAddController();

  @override
  void initState() {
    _controller.payment =
        widget._payment != null ? widget._payment : null;
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
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: InputTextField(
                      textEditingController: _controller.nameCtrl,
                      label: labelNamePayment,
                      disabled: true,
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.yearCtrl,
                      label: labelYear,
                      disabled: true,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(5.0),
                child: Text('1º Semestre:'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.janCtrl,
                      label: labelJan,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.fevCtrl,
                      label: labelFev,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.marCtrl,
                      label: labelMar,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.abrCtrl,
                      label: labelAbr,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.maiCtrl,
                      label: labelMai,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.junCtrl,
                      label: labelJun,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(5.0),
                child: Text('2º Semestre:'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.julCtrl,
                      label: labelJul,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.agoCtrl,
                      label: labelAgo,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.setCtrl,
                      label: labelSet,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.outCtrl,
                      label: labelOut,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.novCtrl,
                      label: labelNov,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      textEditingController: _controller.dezCtrl,
                      label: labelDez,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Button(
        icon: Icons.save,
      ),
    );
  }
}
