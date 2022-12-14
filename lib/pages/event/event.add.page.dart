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

class EventAddPage extends StatefulWidget {
  final Event? _event;
  final String _eventDate;

  EventAddPage(this._event, this._eventDate);

  @override
  State<EventAddPage> createState() => _EventAddPageState();
}

class _EventAddPageState extends State<EventAddPage> {
  final EventAddController _controller = EventAddController();

  @override
  void initState() {
    _controller.event = widget._event ?? _controller.event;
    _controller.eventDate = widget._eventDate;
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(
          widget._event == null ? 'Adicionar ' + _title : 'Editar ' + _title,
        ),
        bottomNavigationBar: MyBottomAppBar(),
        body: _widgets(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Button(
          icon: Icons.save,
          onClick: () =>
              widget._event == null ? _save(context) : _update(context),
        ),
      );

  _widgets(BuildContext context) => ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          _photo(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
              nLines: 3,
              onChanged: _controller.formController.changeDescription,
              errorText: _controller.validateDescription(),
            );
          }),
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
    _controller.save().then(
      (value) {
        if (value != null) {
          AsukaSnackbar.success('Evento cadastrado com sucesso');
          Navigator.pop(context, value);
        } else {
          AsukaSnackbar.alert(_controller.errorMsg).show();
        }
      },
    );
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
