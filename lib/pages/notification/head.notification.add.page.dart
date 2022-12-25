import 'dart:io';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/controllers/head.notification.add.controller.dart';
import 'package:hcslzapp/models/head.notification.dart';
import '../../common/photo.image.provider.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Avisos da Diretoria';
const String _pathNoImage = 'assets/imgs/noImage.png';

class HeadNotificationAddPage extends StatefulWidget {
  final HeadNotification? _headNotification;

  HeadNotificationAddPage(this._headNotification);

  @override
  State<HeadNotificationAddPage> createState() =>
      _HeadNotificationAddPageState();
}

class _HeadNotificationAddPageState extends State<HeadNotificationAddPage> {
  final HeadNotificationAddController _controller =
      HeadNotificationAddController();

  @override
  void initState() {
    _controller.headNotification =
        widget._headNotification ?? _controller.headNotification;
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(
          widget._headNotification == null
              ? 'Adicionar ' + _title
              : 'Editar ' + _title,
        ),
        bottomNavigationBar: MyBottomAppBar(),
        body: _widgets(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Button(
          icon: Icons.save,
          onClick: () => widget._headNotification == null
              ? _save()
              : _update(),
        ),
      );

  _widgets() => ListView(
        children: <Widget>[
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
                label: labelNotificationTitle,
                hint: hintNotificationTitle,
                icon: Icons.title,
                inputType: TextInputType.text,
                onChanged: _controller.formController.changeTitle,
                errorText: _controller.validateTitle(),
              );
            },
          ),
          Observer(
            builder: (_) {
              return MyTextFormField(
                textEditingController: _controller.notificationCtrl,
                label: labelNotification,
                hint: hintNotification,
                icon: Icons.message,
                inputType: TextInputType.text,
                nLines: 5,
                onChanged: _controller.formController.changeNotification,
                errorText: _controller.validateNotification(),
              );
            },
          ),
          SizedBox(
            height: 80,
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

  _save() {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
    } else {
      try {
        _controller.save().then((value) {
          AsukaSnackbar.success(SUCCESS).show();
          Navigator.pop(context, value);
        });
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }

  _update() {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
    } else {
      try {
        _controller.update().then((value) {
          AsukaSnackbar.success(SUCCESS).show();
          Navigator.pop(context, value);
        });
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }
}
