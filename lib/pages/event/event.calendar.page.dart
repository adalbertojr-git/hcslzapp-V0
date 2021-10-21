import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/event.calendar.controller.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event.list.page.dart';

// Example holidays
/*final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};*/

class EventCalendarPage extends StatefulWidget {
  final String _selectedProfile;

  const EventCalendarPage(this._selectedProfile);

  @override
  State<StatefulWidget> createState() => EventCalendarPageState();
}

class EventCalendarPageState extends State<EventCalendarPage>
    with SingleTickerProviderStateMixin {
  EventCalendarController _controller = EventCalendarController();

  @override
  void initState() {
    _controller.init();
    _controller.calController = CalendarController();
    _controller.animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _controller.animController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.animController.dispose();
    _controller.calController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    _controller.setSelectedEvents(events);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EventListPage(
                widget._selectedProfile,
                _controller.selectedEvents,
                _controller.calController.selectedDay,
              )),
    );
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    _controller.setSelectedEvents(List.empty());
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {}

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white30, Colors.deepOrange],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              TopBar(),
              _buildTableCalendarWithBuilders(),
/*              Expanded(
                child: _buildEventList(),
              ),
                         widget._selectedProfile == ADMIN
                ? FloatingActionButton(
                    heroTag: "btnAdd",
                    mini: true,
                    backgroundColor: Colors.deepOrangeAccent[100],
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      _controller.titleCtrl.clear();
                      _showAddDialog(null, 0);
                    },
                  )
                : Container(),*/
            ],
          ),
        ),
      );

  Widget _buildTableCalendarWithBuilders() => Observer(
        builder: (_) => TableCalendar(
          locale: 'pt_BR',
          calendarController: _controller.calController,
          events: _controller.events,
          //holidays: _holidays,
          rowHeight: 55,
          initialCalendarFormat: CalendarFormat.month,
          formatAnimation: FormatAnimation.slide,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          availableGestures: AvailableGestures.all,
          availableCalendarFormats: const {
            CalendarFormat.month: '',
            CalendarFormat.twoWeeks: '',
          },
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            weekendStyle: TextStyle().copyWith(color: Colors.purple),
            holidayStyle: TextStyle().copyWith(color: Colors.purple),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekendStyle: TextStyle().copyWith(color: Colors.purple),
          ),
          headerStyle: HeaderStyle(
            centerHeaderTitle: true,
            formatButtonVisible: false,
          ),
          builders: CalendarBuilders(
            selectedDayBuilder: (context, date, _) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0)
                    .animate(_controller.animController),
                child: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                  child: Text(
                    '${date.day}',
                    style: TextStyle().copyWith(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
            todayDayBuilder: (context, date, _) {
              return CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  '${date.day}',
                  style: TextStyle().copyWith(fontSize: 16.0),
                ),
              );
            },
            markersBuilder: (context, date, events, holidays) {
              final children = <Widget>[];

              if (events.isNotEmpty) {
                children.add(
                  Positioned(
                    right: 1,
                    bottom: 1,
                    child: _buildEventsMarker(date, events),
                  ),
                );
              }

              if (holidays.isNotEmpty) {
                children.add(
                  Positioned(
                    right: -2,
                    top: -2,
                    child: _buildHolidaysMarker(),
                  ),
                );
              }

              return children;
            },
          ),
          onDaySelected: (date, events) {
            _onDaySelected(date, events);
            _controller.animController.forward(from: 0.0);
          },
          onVisibleDaysChanged: _onVisibleDaysChanged,
          onCalendarCreated: _onCalendarCreated,
        ),
      );

  Widget _buildEventsMarker(DateTime date, List events) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: _controller.calController.isSelected(date)
              ? Colors.brown[500]
              : _controller.calController.isToday(date)
                  ? Colors.brown[300]
                  : Colors.blue[400],
        ),
        width: 16.0,
        height: 16.0,
        child: Center(
          child: Text(
            '${events.length}',
            style: TextStyle().copyWith(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ),
      );

  Widget _buildHolidaysMarker() => Icon(
        Icons.add_box,
        size: 20.0,
        color: Colors.blueGrey[800],
      );

/*  Widget _buildEventList() => Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white12,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Expanded(
              child: Observer(
                builder: (_) => ListView.separated(
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
                          //_controller.selectedEvents[i].toString(),
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
            ),
*//*            widget._selectedProfile == ADMIN
                ? FloatingActionButton(
                    heroTag: "btnAdd",
                    mini: true,
                    backgroundColor: Colors.deepOrangeAccent[100],
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      _controller.titleCtrl.clear();
                      _showAddDialog(null, 0);
                    },
                  )
                : Container(),*//*
          ],
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
                nLines: 2,
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
            _controller.calController.selectedDay.toString().substring(0, 10))
        .then(
      (value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: Text('Evento salvo com sucesso.'),
            ),
          );
          _controller.addEvent(value);
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
  */
}
