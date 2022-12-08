import 'dart:io';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/models/event.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../controllers/event.add.controller.dart';

const String _pathNoImage = 'assets/imgs/noImage.png';
const String _title = 'Evento';

class EventAddPage extends StatelessWidget {
  final Event? event;
  final EventAddController _controller = EventAddController();

  EventAddPage(this.event);

  @override
  Widget build(BuildContext context) {
    _controller.event = event ?? _controller.event;
    _controller.init();
    return Scaffold(
      appBar: MyAppBar(
        event == null ? 'Adicionar ' + _title : 'Editar ' + _title,
      ),
      bottomNavigationBar: MyBottomAppBar(),
      body: _widgets(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Button(
        icon: Icons.save,
        onClick: () => event == null ? _save(context) : _update(context),
      ),
    );
  }

  _widgets() => ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.add_photo_alternate,
                  color: Colors.black,
                  size: 28.0,
                ),
                onPressed: _controller.getImageFromGallery,
              ),
              _photo(),
              IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  color: Colors.black,
                  size: 25.0,
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
                textEditingController: _controller.titleCtrl,
                label: labelTitle,
                hint: hintTitle,
                icon: Icons.emoji_people,
                inputType: TextInputType.text,
                onChanged: _controller.formController.changeTitle,
                errorText: _controller.validateTitle(),
              );
            },
          ),
          Observer(builder: (_) {
            return MyTextFormField(
              textEditingController: _controller.descriptionCtrl,
              label: labelDescription,
              hint: hintDescription,
              inputType: TextInputType.text,
              nLines: 4,
              onChanged: _controller.formController.changeDescription,
              errorText: _controller.validateDescription(),
            );
          }),
        ],
      );

  _photo() => Container(
        height: 250.0,
        width: 250.0,
        //padding: EdgeInsets.all(10.0),
/*        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100.0),
        ),*/
        child: Observer(
          builder: (_) => Container(
            decoration: BoxDecoration(
              //color: Colors.white,
              //borderRadius: BorderRadius.circular(150.0),
              image: _loadPhoto(),
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

  _save(BuildContext context) async {
/*    if (_controller.hasErrors) {
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
    }*/
  }

  _update(BuildContext context) async {
/*    if (_controller.hasErrors) {
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
    }*/
  }
}
