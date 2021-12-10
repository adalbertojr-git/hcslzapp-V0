import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/partnership.add.controller.dart';
import 'package:hcslzapp/enums/associated.status.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:asuka/asuka.dart' as asuka;

const String _pathNoImage = 'assets/imgs/noImage.png';
const String _title = 'Parceria';

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
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                TopBar(
                  title: widget.partnership == null
                      ? 'Adicionar ' + _title
                      : 'Editar ' + _title,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.black,
                        size: 43.0,
                      ),
                      onPressed: _controller.getImageFromGallery,
                    ),
                    _photo(),
                    IconButton(
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                        size: 40.0,
                      ),
                      onPressed: _controller.getImageFromCamera,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Observer(
                  builder: (_) {
                    return MyTextFormField(
                      textEditingController: _controller.partnerCtrl,
                      label: labelPartner,
                      hint: hintPartner,
                      icon: Icons.emoji_people,
                      inputType: TextInputType.text,
                      onChanged: _controller.formController.changePartner,
                      errorText: _controller.validatePartner(),
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
                        inputType: TextInputType.number,
                        maskTextInputFormatter:
                            MaskTextInputFormatter(mask: "(##) #####-####"),
                      ),
                    ),
                  ],
                ),
                MyTextFormField(
                  textEditingController: _controller.addressCtrl,
                  label: labelAddress,
                  hint: hintAddress,
                  inputType: TextInputType.text,
                  nLines: 2,
                ),
                MyTextFormField(
                  textEditingController: _controller.promotionCtrl,
                  label: labelPromotion,
                  hint: hintPromotion,
                  inputType: TextInputType.text,
                  nLines: 4,
                ),
                widget.partnership == null
                    ? Container()
                    : Container(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 3.0, 2.0, 3.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Expanded(
                                child: const Text(
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
                                    value: _controller.currentStatus,
                                    items: getStatus(),
                                    onChanged:
                                        _controller.changedStatusDropDownItem,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  height: 80.0,
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Button(
          icon: Icons.save,
          onClick: () => widget.partnership == null ? _save() : _update(),
        ),
      );

  _photo() => Container(
        height: 200.0,
        width: 200.0,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Observer(
          builder: (_) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(150.0),
              image: _loadPhoto(),
            ),
          ),
        ),
      );

  DecorationImage _loadPhoto() => DecorationImage(
      image: _controller.changedPhoto
          ? PhotoImageProvider().getImageProvider(
              File(_controller.photoPath),
            )
          : _controller.photoUrl != null
              ? NetworkImage(_controller.photoUrl)
              : PhotoImageProvider().getImageProvider(
                  File(_pathNoImage),
                ),
      fit: BoxFit.fill);

  _save() async {
    if (_controller.hasErrors) {
      asuka.showSnackBar(
        SnackBar(
          content: const Text('Atenção: Existem erros no formulário que devem '
              'ser corrigidos antes de efetivar a transação.'),
        ),
      );
    } else {
      _controller.save().then(
        (value) {
          if (value != null) {
            asuka.hideCurrentSnackBar();
            asuka.showSnackBar(
              SnackBar(
                content: const Text('Parceiro salvo com sucesso.'),
              ),
            );
            Navigator.of(context).pop(value);
          } else {
            asuka.showSnackBar(
              SnackBar(
                content: Text(_controller.errorMsg),
              ),
            );
          }
        },
      );
    }
  }

  _update() async {
    if (_controller.hasErrors) {
      asuka.showSnackBar(
        SnackBar(
          content: const Text('Atenção: Existem erros no formulário que devem '
              'ser corrigidos antes de efetivar a transação.'),
        ),
      );
    } else {
      var response = true;
      if (_controller.currentStatus == 'Inativo') {
        response = await showDialog(
            context: context,
            builder: (context) {
              return TransactionAuthDialog(
                  msg:
                      'O parceiro inativado não será mais visto pelos associados no App. ' +
                          '\n\n' +
                          'Confirma?');
            });
      }
      if (response == true) {
        asuka.showSnackBar(
          SnackBar(
            content: const Text('Aguarde...'),
          ),
        );
        _controller.update().then(
          (value) {
            if (value != null) {
              asuka.hideCurrentSnackBar();
              asuka.showSnackBar(
                SnackBar(
                  content: const Text('Parceiro atualizado com sucesso.'),
                ),
              );
              Navigator.pop(context, value);
            } else {
              asuka.showSnackBar(
                SnackBar(
                  content: Text(_controller.errorMsg),
                ),
              );
            }
          },
        );
      }
    }
  }
}
