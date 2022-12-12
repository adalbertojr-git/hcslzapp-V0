import 'dart:io';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/partnership.add.controller.dart';
import 'package:hcslzapp/enums/associated.status.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _pathNoImage = 'assets/imgs/noImage.png';
const String _title = 'Parceria';

class PartnershipAddPage extends StatelessWidget {
  final Partnership? partnership;
  final PartnershipAddController _controller = PartnershipAddController();

  PartnershipAddPage(this.partnership);

  @override
  Widget build(BuildContext context) {
    _controller.partnership = partnership ?? _controller.partnership;
    _controller.init();
    return Scaffold(
      appBar: MyAppBar(
        partnership == null ? 'Adicionar ' + _title : 'Editar ' + _title,
      ),
      bottomNavigationBar: MyBottomAppBar(),
      body: _widgets(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Button(
        icon: Icons.save,
        onClick: () => partnership == null ? _save(context) : _update(context),
      ),
    );
  }

  _widgets(BuildContext context) => ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          _photo(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.add_photo_alternate,
                  size: 28.0,
                ),
                onPressed: _controller.getImageFromGallery,
              ),
              IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  size: 25.0,
                ),
                onPressed: _controller.getImageFromCamera,
              ),
            ],
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
            textBaseline: TextBaseline.alphabetic,
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
          partnership == null
              ? Container()
              : Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 3.0, 2.0, 3.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
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
                              onChanged: _controller.changedStatusDropDownItem,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          SizedBox(
            height: 40,
          )
        ],
      );

  _photo(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Observer(
            builder: (_) => Container(
              decoration: BoxDecoration(
                image: _loadPhoto(),
              ),
            ),
          ),
        ),
      );

  DecorationImage _loadPhoto() => DecorationImage(
      image: _controller.changedPhoto
          ? PhotoImageProvider().getImageProvider(
              File(_controller.photoPath),
            ) as ImageProvider
          : _controller.photoUrl != ""
              ? NetworkImage(_controller.photoUrl)
              : PhotoImageProvider().getImageProvider(
                  File(_pathNoImage),
                ) as ImageProvider,
      fit: BoxFit.fill);

  _save(BuildContext context) {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert('Corrija os erros informados').show();
    } else {
      _controller.save().then(
        (value) {
          if (value != null) {
            AsukaSnackbar.success('Parceiro salvo com sucesso');
            Navigator.of(context).pop(value);
          } else {
            AsukaSnackbar.alert(_controller.errorMsg).show();
          }
        },
      );
    }
  }

  _update(BuildContext context) async {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert('Corrija os erros informados').show();
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
        AsukaSnackbar.message('Aguarde...').show();
        _controller.update().then(
          (value) {
            if (value != null) {
              AsukaSnackbar.success('Parceiro atualizado com sucesso');
              Navigator.pop(context, value);
            } else {
              AsukaSnackbar.alert(_controller.errorMsg).show();
            }
          },
        );
      }
    }
  }
}
