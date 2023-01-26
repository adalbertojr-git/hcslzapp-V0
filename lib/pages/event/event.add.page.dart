import 'dart:io';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/models/event.dart';
import 'package:intl/intl.dart';
import '../../common/associated.profiles.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../controllers/event.add.controller.dart';

const String _pathNoImage = 'assets/imgs/noImage.png';
const String _title = 'Evento';

class EventAddPage extends StatefulWidget {
  final Event? _event;
  final String _eventDate;
  final String _selectedProfile;

  EventAddPage(
    this._selectedProfile,
    this._event,
    this._eventDate,
  );

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
          widget._selectedProfile == ASSOCIATED
              ? _title
              : widget._event == null
                  ? 'Adicionar ' + _title
                  : 'Editar ' + _title,
        ),
        bottomNavigationBar: MyBottomAppBar(),
        body: _widgets(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: widget._selectedProfile == ADMIN
            ? Button(
                icon: Icons.save,
                onClick: () => widget._event == null ? _save() : _update(),
              )
            : null,
      );

  _widgets() => ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          _photo(context),
          widget._selectedProfile == ADMIN
              ? Row(
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
                )
              : Container(),
          Observer(
            builder: (_) {
              return MyTextFormField(
                textEditingController: _controller.titleCtrl,
                label: labelTitle,
                hint: hintTitle,
                icon: Icons.title,
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
              icon: Icons.description,
              inputType: TextInputType.text,
              nLines: 3,
              onChanged: _controller.formController.changeDescription,
              errorText: _controller.validateDescription(),
            );
          }),
          Row(
            children: <Widget>[
              Expanded(
                child: Observer(
                  builder: (_) {
                    return MyTextFormField(
                      textEditingController: _controller.iniDateCtrl,
                      label: labelInitialDate,
                      hint: hintDate,
                      icon: Icons.calendar_today,
                      inputType: TextInputType.datetime,
                      disabled: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                          _controller.iniDateCtrl.text = formattedDate;
                        }
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return MyTextFormField(
                      textEditingController: _controller.endDateCtrl,
                      label: labelEndDate,
                      hint: hintDate,
                      icon: Icons.calendar_today,
                      inputType: TextInputType.datetime,
                      disabled: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          _controller.endDateCtrl.text =
                              _controller.formatDate(pickedDate);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
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

  _save() async {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
    } else {
      try {
        AsukaSnackbar.message(WAIT).show();
        final value = await _controller.save();
        AsukaSnackbar.success(SUCCESS).show();
        Navigator.pop(context, value);
      } on HttpException catch (e) {
        AsukaSnackbar.alert(e.message.toString()).show();
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }

  _update() async {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
    } else {
      try {
        AsukaSnackbar.message(WAIT).show();
        final value = await _controller.update();
        AsukaSnackbar.success(SUCCESS).show();
        Navigator.pop(context, value);
      } on HttpException catch (e) {
        AsukaSnackbar.alert(e.message.toString()).show();
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }
}
