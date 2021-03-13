import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/dependent.controller.dart';
import 'package:hcslzapp/controllers/partnership.add.controller.dart';
import 'package:hcslzapp/enums/associated.status.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PartnershipAddPage extends StatefulWidget {
  final Partnership partnership;

  PartnershipAddPage(this.partnership);

  @override
  _PartnershipAddPageState createState() => _PartnershipAddPageState();
}

class _PartnershipAddPageState extends State<PartnershipAddPage> {
  PartnershipAddController _controller = PartnershipAddController();

  @override
  void initState() {
    _controller.partnership =
        widget.partnership != null ? widget.partnership : null;
    _controller.init;
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
                Observer(
                  builder: (_) {
                    return MyTextFormField(
                      textEditingController: _controller.partnerCtrl,
                      label: labelPartner,
                      hint: hintPartner,
                      icon: Icons.emoji_people,
                      inputType: TextInputType.text,
                      onChanged: _controller.formController.changeName,
                      errorText: _controller.validateName(),
                    );
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Expanded(
                      child: MyTextFormField(
                        textEditingController: _controller.phone1Ctrl,
                        label: labelPhone,
                        hint: hintPhone,
                        icon: Icons.phone,
                        inputType: TextInputType.number,
                        maskTextInputFormatter:
                            MaskTextInputFormatter(mask: "(##) #####-####"),
                      ),
                    ),
                    Expanded(
                      child: MyTextFormField(
                        textEditingController: _controller.phone2Ctrl,
                        label: labelPhone,
                        hint: hintPhone,
                        icon: Icons.phone,
                        inputType: TextInputType.datetime,
                        maskTextInputFormatter:
                            MaskTextInputFormatter(mask: "(##) #####-####"),
                      ),
                    ),
                  ],
                ),
                MyTextFormField(
                  textEditingController: _controller.phone2Ctrl,
                  label: labelAddress,
                  hint: hintAddress,
                  inputType: TextInputType.datetime,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "##/##/####"),
                ),
                MyTextFormField(
                  textEditingController: _controller.phone2Ctrl,
                  label: labelPromotion,
                  hint: hintPromotion,
                  inputType: TextInputType.text,
                  nLines: 10,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 3.0, 2.0, 3.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Status:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 55.0,
                            child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              //value: _controller.currentStatus,
                              items: getStatus(),
                              onChanged: _controller.changedStatusDropDownItem,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Button(
          icon: Icons.save,
        ),
      ),
    );
  }
}
