import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/associated.profiles.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/event.list.controller.dart';
import 'package:hcslzapp/models/event.dart';
import 'package:asuka/asuka.dart' as asuka;

class EventListPage extends StatefulWidget {
  final String _selectedProfile;
  final List selectedEvents;
  final DateTime selectedDay;

  const EventListPage(
      this._selectedProfile, this.selectedEvents, this.selectedDay);

  @override
  State<StatefulWidget> createState() {
    return EventListPageState();
  }
}

class EventListPageState extends State<EventListPage> {
  EventListController _controller = EventListController();

  @override
  void initState() {
    _controller.init();
    _controller.selectedEvents = widget.selectedEvents;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _widgets(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: widget._selectedProfile == ADMIN
            ? Button(
                icon: Icons.add,
                onClick: () {
                  _controller.titleCtrl.clear();
                  _showAddDialog(null, 0);
                },
              )
            : Container(),
      );

  _widgets() => Observer(
        builder: (_) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white30, Colors.deepOrange],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TopBar(
                  title: 'Eventos do dia ' + widget.selectedDay.day.toString()),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _controller.selectedEvents.length,
                  itemBuilder: (_, int i) {
                    var event = _controller.selectedEvents[i] as Event;
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black12,
                            // blurRadius: 10.0,
                            offset: Offset(0.0, 5.0),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            child: Icon(Icons.event),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        trailing: widget._selectedProfile == ADMIN
                            ? Wrap(
                                spacing: 10, // space between two icons
                                children: <Widget>[
                                  GestureDetector(
                                    child: Icon(
                                      Icons.delete,
                                    ),
                                    onTap: () {
                                      _delete(i);
                                    },
                                  ),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.edit,
                                    ),
                                    onTap: () {
                                      _controller.setEventTitle(event.title);
                                      _showAddDialog(event, i);
                                    },
                                  ),
                                ],
                              )
                            : null,
                        title: Text(
                          event.title,
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, int index) => const Divider(),
                ),
              ),
            ],
          ),
        ),
      );

  _showAddDialog(Event event, int i) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white70,
              title: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Evento',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              content: MyTextFormField(
                textEditingController: _controller.titleCtrl,
                label: labelTitle,
                hint: hintTitle,
                inputType: TextInputType.text,
                fontSize: 12,
              ),
              actions: <Widget>[
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: FloatingActionButton(
                        heroTag: "btnCancel",
                        mini: true,
                        backgroundColor: Colors.deepOrangeAccent[100],
                        child: Icon(
                          Icons.cancel_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: FloatingActionButton(
                        heroTag: "btnSave",
                        mini: true,
                        backgroundColor: Colors.deepOrangeAccent[100],
                        child: Icon(
                          Icons.save,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          if (event == null) {
                            _save();
                          } else {
                            _update(event, i);
                          }
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ));
  }

  _save() {
    _controller
        .save(_controller.titleCtrl.text,
            widget.selectedDay.toString().substring(0, 10))
        .then(
      (value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: Text('Evento salvo com sucesso.'),
            ),
          );
          _controller.addEvent(value, widget.selectedDay);
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

  _update(Event event, int i) {
    event.title = _controller.titleCtrl.text;
    _controller.update(event).then(
      (value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: Text('Evento atualizado com sucesso.'),
            ),
          );
          _controller.editEvent(i);
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

  _delete(int i) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(msg: 'Confirma a exclusão do evento?');
        });
    if (response == true) {
      var event = _controller.selectedEvents[i] as Event;
      _controller.deleteById(event).then(
        (value) {
          if (value != null) {
            asuka.showSnackBar(
              SnackBar(
                content: Text('Evento excluido com sucesso.'),
              ),
            );
            setState(() {
              _controller.removeSelectedEvent(i);
            });
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
